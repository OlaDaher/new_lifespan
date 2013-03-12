class DonorAbility < ActiveRecord::Base
  include CanCan::Ability

  def initialize(donor)
  	donor ||= Donor.new

    if donor.donor?
    	can :read
    else 
    	can :manage, :all	
    end	

  end  
end
