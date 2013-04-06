class DonorsController < ApplicationController
  load_and_authorize_resource
  

  # GET /donors
  # GET /donors.json
 
  def index
    @title = "Donor List"
    @donors = Donor.all

    @grouped = {}
    Donor.all.each do |donor|
      if donor.admin == false
        if donor.active == true
          letter = donor.blood_type.slice(0,2).upcase
          @grouped[letter] ||= []
          @grouped[letter] << donor
        end  
      end  
    end

    @grouped_inactive = {}
     Donor.all.each do |donor|
      if donor.admin == false
        if donor.active == false
          letter = donor.blood_type.slice(0,2).upcase
          @grouped_inactive[letter] ||= []
          @grouped_inactive[letter] << donor
        end  
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
        session[:donor_id] = @donor.id
        format.html { redirect_to @donor, :notice => "Donor was succesfully created." }
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
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to @donor, notice: "#{@donor.proper_name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor = Donor.find(params[:id])
    if current_donor.id == @donor.id
      session[:donor_id] = nil
      @donor.destroy
    else  
      @donor.destroy
    end  
    respond_to do |format|
      format.html {  redirect_to root_url, :notice => "Donor Deleted!" }
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
    @time = Time.now
    DonorMailer.new_donor_request(@donors, @medic, @org, @blood).deliver

    @twitter = "#{@blood} is needed at #{@org.name} in #{@org.region}, telephone: +#{@org.phone}. Sent: #{@time}. SHARE IT AND SAVE SOMEONE'S LIFE"

    Twitter.update(@twitter)
    redirect_to root_url
    
  end

  
end
