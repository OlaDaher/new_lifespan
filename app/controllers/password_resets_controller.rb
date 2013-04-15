class PasswordResetsController < ApplicationController
    skip_authorization_check
  def new
  end
  def create
    if medic = Medic.find_by_email(params[:email]) == nil
      redirect_to new_password_reset_path, :notice => "Your email address is not yet registered in our system."
    elsif donor = Donor.find_by_email(params[:email]) == nil
      redirect_to new_password_reset_path, :notice => "Your email address is not yet registered in our system."
    elsif
      medic = Medic.find_by_email(params[:email])
      medic.send_password_reset if medic
      redirect_to root_url, :notice => "Email sent with password reset instructions."
    elsif
      donor = Donor.find_by_email(params[:email])
      donor.send_password_reset if donor
      redirect_to root_url, :notice => "Email sent with password reset instructions."
    end
  end
  
  def edit
    
  end
end
