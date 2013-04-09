class SessionsController < ApplicationController
   skip_authorization_check
    def new
      @title = "Log in"
  	end

  	def create
    	donor = Donor.find_by_email(params[:email])
 		  if donor && donor.authenticate(params[:password])
          # session[:donor_id] = donor.id

          if current_donor && current_donor.admin == true
            if params[:remember_me]
              cookies.permanent[:auth_token] = donor.auth_token
            else
              cookies[:auth_token] = donor.auth_token  
            end
            puts "\n\n\n\n\n #{cookies[:auth_token]}\n\n\n\n"
    		    redirect_to root_url, :notice => "Welcome System Admin, You're Signed in!"
          else
            if params[:remember_me]
              cookies.permanent[:auth_token] = donor.auth_token
            else
              cookies[:auth_token] = donor.auth_token  
            end
            puts "\n\n\n\n\n #{cookies[:auth_token]}\n\n\n\n" 
            redirect_to root_url, :notice => "Welcome #{donor.proper_name}, You're Signed in!"
          end
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
      if session[:donor_id]
        if current_donor && current_donor.admin == true
          # session[:donor_id] = nil
          cookies.delete(:auth_token)
  	      redirect_to root_url, :notice => "System Admin Logged out!"
        else 
          # session[:donor_id] = nil
          cookies.delete(:auth_token)
          redirect_to root_url, :notice => "You have Logged out!"
        end
      else
        redirect_to root_url, :notice => "Unauthorized command!" 
      end   
    end
end    
