class SessionsController < ApplicationController
    def new
      @title = "Log in"
  	end

  	def create
    	donor = Donor.find_by_email(params[:email])
 		  if donor && donor.authenticate(params[:password])
    		session[:donor_id] = donor.id
    		redirect_to root_url, :notice => "Logged in!"
  		else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
    	session[:donor_id] = nil
    	redirect_to root_url, :notice => "Logged out!"
  	end
end
