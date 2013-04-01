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
        if medic.admin == true
    		  redirect_to root_url, :notice => "Welcome Admin of #{medic.organization.name}, You're Signed in!"
    #    elsif medic.first_name.empty? || medic.last_name.empty? || medic.position.empty? || medic.phone.empty? == true
     #     redirect_to edit_medic_path(medic), :notice => "Welcome Dr. #{medic.position}! Please complete your Personal Details before proceeding!"
        else
           redirect_to root_url, :notice => "Welcome Dr. #{medic.position}! Please complete your Personal Details before proceeding!"
          #redirect_to root_url, :notice => "Welcome Dr. #{medic.proper_name}, You're Signed in!"
  		 
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
