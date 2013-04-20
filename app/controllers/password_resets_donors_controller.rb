class PasswordResetsDonorsController < ApplicationController
  skip_authorization_check
  def new
  end
  
  def create
    if donor = Donor.find_by_email(params[:email]) == nil
      redirect_to new_password_resets_donor_path, :notice => "Your email address is not yet registered in our system."
    else
      donor = Donor.find_by_email(params[:email])
      donor.send_password_resets_donor if donor
      redirect_to root_url, :notice => "Email sent with password reset instructions."
    end
  end
  
  def edit
    @donor = Donor.find_by_password_resets_donor_token!(params[:id])
  end
  
  def update
    @donor = Donor.find_by_password_resets_donor_token!(params[:id])
    if @donor.password_resets_donor_sent_at < 2.hours.ago
      redirect_to new_password_resets_donor_path, :alert => "Password &crarr; 
        reset has expired."
    elsif @donor.update_attributes(params[:donor])
      redirect_to root_url, :notice => "Password has been reset."
    else
      render :edit
    end
  end
end
