class MedicsessionsController < ApplicationController
#load_and_authorize_resource
skip_authorization_check
    def new
      @title = "Log in"
  	end

  	def create
    	medic  = Medic.find_by_email(params[:email])
 		  if medic && medic.authenticate(params[:password])
    		session[:medic_id] = medic.id
        redirect_to root_url, :notice => "Logged in!"
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

      #   if medic.admin == true && (medic.first_name.empty? || medic.last_name.empty? || medic.position.empty? || medic.phone.empty?)
   #      redirect_to root_url, :notice => "Welcome Admin of #{medic.organization.name}, You're Signed in!"
      #    redirect_to edit_medic_path(medic), :notice => "Welcome Dr. #{medic.position}! Please complete your Personal Details before proceeding!"
       # elsif medic.admin == true
        #   redirect_to root_url, :notice => "Welcome Dr. #{medic.position}!"
          #redirect_to root_url, :notice => "Welcome Dr. #{medic.proper_name}, You're Signed in!"
  	
    def destroy
    	session[:medic_id] = nil
    	redirect_to root_url, :notice => "Medic Logged out!"
  	end

end
