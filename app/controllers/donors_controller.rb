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

    respond_to do |format|
      if @donor.save
        DonorMailer.donor_authentication(@donor).deliver
        format.html { redirect_to root_path, :notice => "#{@donor.proper_name} was succesfully created. Please click on the confirmation link sent to your email inbox to verify your LifeSpan+ account." }
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
    if @blood == "A-"
      @donors_one_type = Donor.bloodtype_a_m
    end
    if @blood == "A+"
      @donors_one_type = Donor.bloodtype_a_p
    end
    if @blood == "B-"
      @donors_one_type = Donor.bloodtype_b_m
    end
    if @blood == "B+"
      @donors_one_type = Donor.bloodtype_b_p
    end
    if @blood == "AB-"
      @donors_one_type = Donor.bloodtype_ab_m
    end
    if @blood == "AB+"
      @donors_one_type = Donor.bloodtype_ab_p
    end
    if @blood == "O+"
      @donors_one_type = Donor.bloodtype_o_p
    end
    if @blood == "O-"
      @donors_one_type = Donor.bloodtype_o_m
    end
    @org = @medic.organization
    @time = Time.now.localtime.strftime("%H:%M:%S")
    DonorMailer.new_donor_request(@donors_one_type, @medic, @org, @blood).deliver
    @twitter = "#{@blood} is needed at #{@org.name} in #{@org.region}, telephone: +#{@org.phone} (Sent: #{@time})"
    @msg = " (Sent: #{@time}) #{@blood} is needed at #{@org.name} in #{@org.region}, telephone: +#{@org.phone}"
    Twitter.update(@twitter)
    @donors_one_type.each do |d|
       d.initializeSMS(@blood, @org.name, @org.phone, d.phone)
    end
    @req=Request.new(:content => @msg, :posted_at => Time.now)
    @req.save!
    redirect_to root_url
  end

  def confirm_account
      @donor = Donor.find(params[:id])
      @donor.authenticated = true
      @donor.save!
      session[:donor_id] = @donor.id
      redirect_to @donor, notice: 'You are now the 4%! Lets Donate!'
  end

 private

   def skip_password_attribute
    if params[:password].blank? && params[:password_validation].blank?
      params.except!(:password, :password_validation)
    end
  end
end
