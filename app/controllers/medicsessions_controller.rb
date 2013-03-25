class MedicsessionsController < ApplicationController
	def new
      @title = "Log in"
  	end

  	def create
    	medic  = Medic.find_by_email(params[:email])
 		  if medic && medic.authenticate(params[:password])
    		session[:medic_id] = medic.id
        if medic.admin == true
    		redirect_to root_url, :notice => "Admin Logged in!"
        else
        redirect_to edit_medic_path(medic), :notice => "Please fill in your Personal Information!"
  		  end
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
    	session[:medic_id] = nil
    	redirect_to root_url, :notice => "Logged out!"
  	end

end
