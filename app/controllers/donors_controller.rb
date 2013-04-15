class DonorsController < ApplicationController
  load_and_authorize_resource
  before_filter :skip_password_attribute, only: :update
  

  # GET /donors
  # GET /donors.json
 
  def index
    @title = "Donor List"
    @donors = Donor.all

    @grouped = {}
    Donor.all.each do |donor|
      if donor.admin == false
          letter = donor.blood_type.slice(0,2).upcase
          @grouped[letter] ||= []
          @grouped[letter] << donor
      end  
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donors }
    end
  end

  # GET /donors/1
  # GET /donors/1.json
  def show
    @title = "Show Donor"
    @donor = Donor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donor }
    end
  end

  # GET /donors/new
  # GET /donors/new.json
  def new
    @title = "New Donor"
    @donor = Donor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donor }
    end
  end

  # GET /donors/1/edit
  def edit
    @title = "Edit Donor"
    @donor = Donor.find(params[:id])
  end

  # POST /donors
  # POST /donors.json
  def create
    @title = "Donor Created"
    @donor = Donor.new(params[:donor])

    @code = params[:donor][:password]
    @f_name = params[:donor][:first_name]
    @l_name = params[:donor][:last_name]
    @email_id = params[:donor][:email]
    at_index = @email_id.index('@')
    username = @email_id[0,at_index-1]
    if @code.include?(username) || @code.include?(@f_name) || @code.include?(@l_name) == true
        @donor.errors.full_messages << "password can't contain your first name, last name or email"
    end

    respond_to do |format|
      if @donor.save
        session[:donor_id] = @donor.id
        format.html { redirect_to @donor, :notice => "#{@donor.proper_name} was succesfully created." }
        format.json { render json: @donor, status: :created, location: @donor }
      
         
      else
        format.html { render action: "new" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donors/1
  # PUT /donors/1.json
  def update
    @title = "Donor Updated"
    @donor = Donor.find(params[:id])
    respond_to do |format|
      params[:donor].delete(:password) if params[:donor][:password].blank?
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to @donor, notice: "#{@donor.proper_name} was successfully updated." }
        format.json { head :no_content }
      else
        @title = "Edit Donor"
        format.html { render action: "edit" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

   def skip_password_attribute
    if params[:password].blank? && params[:password_validation].blank?
      params.except!(:password, :password_validation)
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor = Donor.find(params[:id])
    if current_donor.id == @donor.id
      session[:donor_id] = nil
      cookies.delete(:auth_token)
      @donor.destroy
    else  
      cookies.delete(:auth_token)
      @donor.destroy
    end  
    respond_to do |format|
      format.html {  redirect_to root_url, :notice => "#{@donor.proper_name} Deleted!" }
      format.json { head :no_content }
    end
  end
  
  
  def send_request
  end
  
  def send_one_blood_type
    @medic = Medic.find(session[:medic_id])
    @donors = Donor.all
    @blood = params[:BloodType]
    @org = @medic.organization
    @time = Time.now.strftime("%H:%M:%S")
    DonorMailer.new_donor_request(@donors, @medic, @org, @blood).deliver
    @twitter = "#{@blood} is needed at #{@org.name} in #{@org.region}, telephone: +#{@org.phone} (Sent: #{@time})"
    Twitter.update(@twitter)
    @donors.each do |d|
       d.initializeSMS(@blood, @org.name, @org.phone, d.phone)
    end
    redirect_to root_url
  end
end
