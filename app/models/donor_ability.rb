class DonorAbility < ActiveRecord::Base
  include CanCan::Ability

  def initialize(donor)
  	donor ||= Donor.new

    if donor.donor?
    	
    else 
    	can :manage, :all	
    end	

  end  
end
