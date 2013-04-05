class MedicAbility
  include CanCan::Ability

    def initialize(medic)
        can [:show, :update, :destroy], Medic, :id => medic.id
        cannot :manage, Organization
        can :read, Organization
        cannot [:create, :update, :destroy], Donor
        can :read, Donor
        can :send_request, Donor
        
        if medic.admin == true
            can :manage, Medic
           
            #cannot :create, Medic
            #can(:create, Medic) do |organization|
            #    permitted = organization.id === medic.organization_id
            #    permitted
            #end
         else 
            cannot :manage, Medic    
        end
    end        
end    

