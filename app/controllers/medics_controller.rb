class MedicsController < ApplicationController
  # GET /medics
  # GET /medics.json
  def index
    @title = "Doctor List"
    @medics = Medic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medics }
    end
  end

  # GET /medics/1
  # GET /medics/1.json
  def show
    @title = "Current Medic"
    @medic = Medic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medic }
    end
  end

  # GET /medics/new
  # GET /medics/new.json
  def new
    @title = "New Medic"
    @medic = Medic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medic }
    end
  end

  # GET /medics/1/edit
  def edit
    @title = "Edit Medic"
    @medic = Medic.find(params[:id])
  end

  # POST /medics
  # POST /medics.json
  def create
    @title = "Medic Created"
    @medic = Medic.new(params[:medic])

    respond_to do |format|
      if @medic.save
        format.html { redirect_to @medic, notice: 'Medic was successfully created.' }
        format.json { render json: @medic, status: :created, location: @medic }
      else
        format.html { render action: "new" }
        format.json { render json: @medic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medics/1
  # PUT /medics/1.json
  def update
    @title = "Details Updated"
    @medic = Medic.find(params[:id])

    respond_to do |format|
      if @medic.update_attributes(params[:medic])
        format.html { redirect_to @medic, notice: 'Medic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medics/1
  # DELETE /medics/1.json
  def destroy
    @medic = Medic.find(params[:id])
    @medic.destroy

    respond_to do |format|
      format.html { redirect_to medics_url }
      format.json { head :no_content }
    end
  end
end
