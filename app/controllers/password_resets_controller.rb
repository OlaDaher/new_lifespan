class PasswordResetsController < ApplicationController
    skip_authorization_check
  def new
  end
  def create
    medic = Medic.find_by_email(params[:email])
    medic.send_password_reset if medic
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end
end
