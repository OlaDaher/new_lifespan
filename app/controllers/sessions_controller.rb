class SessionsController < ApplicationController
   #load_and_authorize_resource
   skip_authorization_check
    def new
      @title = "Log in"
  	end

  	def create
    	donor = Donor.find_by_email(params[:email])
 		  if donor && donor.authenticate(params[:password])
        # cookies.permanent[:auth_token] = user.auth_token
        if donor.admin == true
          if params[:remember_me]
            cookies.permanent[:auth_token] = donor.auth_token
          else
            cookies[:auth_token] = donor.auth_token  
          end
    		  redirect_to root_url, :notice => "Welcome System Admin, You're Signed in!"
        else
          if params[:remember_me]
            cookies.permanent[:auth_token] = donor.auth_token
          else
            cookies[:auth_token] = donor.auth_token  
          end
          redirect_to root_url, :notice => "Welcome #{donor.proper_name}, You're Signed in!"
  		  end
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
    cookies.delete(:auth_token)
  	redirect_to root_url, :notice => "Donor Logged out!"
  	end
end
