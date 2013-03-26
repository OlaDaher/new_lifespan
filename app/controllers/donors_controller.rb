class DonorsController < ApplicationController
  # GET /donors
  # GET /donors.json
   #load_and_authorize_resource :only => [:index, :show]
  def index
    @title = "Donor List"
    @donors = Donor.all

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
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
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
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
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
    @donor.destroy

    respond_to do |format|
      format.html { redirect_to donors_url }
      format.json { head :no_content }
    end
  end
  
  def send_request
    # redirect_to send_one_blood_type_path
    @medic = Medic.find(session[:medic_id])
    @donors = Donor.all
    @org = Organization.find_by_id(@medic.organization_id)
#    render :text => "Message sent successfully"
    # if redirect_to send_one_blood_type_path      
       DonorMailer.new_donor_request(@donors, @medic, @org).deliver
       # format.html { redirect_to send_one_blood_type_path, notice: 'The requests have been sent jhgfdsdfghj jhgfd.' }
    # end
  end
  
end
