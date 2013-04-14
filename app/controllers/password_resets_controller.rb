class PasswordResetsController < ApplicationController
  def new
    medic = Medic.find_by_email(params[:email])
    medic.send_password_reset if medic
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end
end
