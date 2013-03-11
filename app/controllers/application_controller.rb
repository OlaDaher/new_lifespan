class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def current_donor
    @current_donor ||= Donor.find(session[:donor_id]) if session[:donor_id]
  end

  helper_method :current_donor

  def current_medic
    @current_medic ||= Medic.find(session[:medic_id]) if session[:medic_id]
  end

  helper_method :current_medic



  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access denied."
  	redirect_to root_url
  end
end
