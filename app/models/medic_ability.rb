class MedicAbility
  include CanCan::Ability

    def initialize(medic)
       
        if medic.admin == false
            can [:read, :update, :destroy], Medic, :id => medic.id
            cannot :manage, Organization
            cannot :manage, Donor
            alias_action :send_request, :to => :send_request
            can :send_request, Donor
        else     
            can :manage, Medic, :organization_id = medic.organization_id
            cannot :manage, Organization
            cannot :manage, Donor   
            alias_action :send_request, :to => :send_request
            can :send_request, Donor	
        end
	end        
end    