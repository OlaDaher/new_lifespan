class PasswordResetsController < ApplicationController
    skip_authorization_check
  def new
  end
  def create
    if medic = Medic.find_by_email(params[:email]) == nil
      # if donor = Donor.find_by_email(params[:email]) == nil
        redirect_to new_password_reset_path, :notice => "Your email address is not yet registered in our system."
      # else
      #   donor = Donor.find_by_email(params[:email])
      #   donor.send_password_reset if donor
      #   redirect_to root_url, :notice => "Email sent with password reset instructions."
      # end
    # elsif donor = Donor.find_by_email(params[:email]) == nil
    #   redirect_to new_password_reset_path, :notice => "Your email address is not yet registered in our system DONOR."
    else
      medic = Medic.find_by_email(params[:email])
      medic.send_password_reset if medic
      redirect_to root_url, :notice => "Email sent with password reset instructions."
    end
  end
  
  def edit
      @medic = Medic.find_by_password_reset_token!(params[:id])
  end
  # def edit_donor
  #     @donor = Donor.find_by_password_reset_token!(params[:id])  
  # end
  
  def update
    # if @medic = Medic.find_by_password_reset_token!(params[:id]) == nil
    #   @donor = Donor.find_by_password_reset_token!(params[:id])
    #   if @donor.password_reset_sent_at < 2.hours.ago
    #     redirect_to new_password_reset_path, :alert => "Password &crarr; 
    #       reset has expired."
    #   elsif @donor.update_attributes(params[:medic])
    #     redirect_to root_url, :notice => "Password has been reset."
    #   else
    #     render :edit
    #   end
    # else
    #   @medic = Medic.find_by_password_reset_token!(params[:id])
    #   if @medic.password_reset_sent_at < 2.hours.ago
    #     redirect_to new_password_reset_path, :alert => "Password &crarr; 
    #       reset has expired."
    #   elsif @medic.update_attributes(params[:medic])
    #     redirect_to root_url, :notice => "Password has been reset."
    #   else
    #     render :edit
    #   end
    # end
  
    @medic = Medic.find_by_password_reset_token!(params[:id])
    if @medic.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password &crarr; 
        reset has expired."
    elsif @medic.update_attributes(params[:medic])
      redirect_to root_url, :notice => "Password has been reset."
    else
      render :edit
    end
  end
end
