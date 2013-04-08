class MedicsessionsController < ApplicationController
skip_authorization_check
    def new
      @title = "Log in"
  	end

  	def create
    	medic  = Medic.find_by_email(params[:email])
 		  if medic && medic.authenticate(params[:password])
    		session[:medic_id] = medic.id
        if current_medic && current_medic.admin == true
          redirect_to root_url, :notice => "Welcome, #{medic.organization.name} Medical Administrator!"
        else
          if current_medic.first_name.blank? == false && current_medic.last_name.blank? == false
            redirect_to root_url, :notice => "Welcome, Dr. #{medic.proper_name}!"
          else
            redirect_to edit_medic_path(medic), :notice => "Please fill in your personal details before proceeding!"
          end
        end  
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
      if session[:medic_id]
    	  if current_medic && current_medic.admin == true
          session[:medic_id] = nil
    	    redirect_to root_url, :notice => "Medical Admin Logged out!"
        else
          session[:medic_id] = nil
          redirect_to root_url, :notice => "Medical Staff Logged out!"
        end  
      else 
        redirect_to root_url, :notice => "Unauthorized command!"
      end  
  	end
end
