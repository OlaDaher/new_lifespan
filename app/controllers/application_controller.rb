class ApplicationController < ActionController::Base
  check_authorization
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
 
  def current_medic
    @current_medic ||= Medic.find(session[:medic_id]) if session[:medic_id]
  end

  def current_donor
    @current_donor ||= Donor.find(session[:donor_id]) if session[:donor_id]
  end

  def current_user
    @current_user ||= current_donor || current_medic
  end

  def current_ability
    if current_user.kind_of?(Medic)
      @current_ability ||= MedicAbility.new(current_medic)
    else
      @current_ability ||= DonorAbility.new(current_donor)
    end
  end

  helper_method :current_donor
  helper_method :current_ability
  helper_method :current_medic
end
