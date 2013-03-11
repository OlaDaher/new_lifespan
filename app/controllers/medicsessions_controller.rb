class MedicsessionsController < ApplicationController
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

  	def destroy
    	session[:medic_id] = nil
    	redirect_to root_url, :notice => "Logged out!"
  	end

end
