class MedicAbility
  include CanCan::Ability

    def initialize(medic)
        cannot :manage, Medic 
        can [:show, :update, :destroy], Medic, :id => medic.id
        cannot :manage, Organization
        can :read, Organization
        cannot :manage, Donor
        can :read, Donor
        can :send_request, Donor
        can :send_one_blood_type, Donor
        
        if medic.admin == true
            cannot :manage, Medic
            cannot :manage, Organization
            cannot :manage, Donor
            can :read, Donor
            can :send_request, Donor
            can :send_one_blood_type, Donor
            can [:create, :read, :destroy], Medic, :organization_id => medic.organization_id
            can [:read, :update], Organization, :id => medic.organization_id
     
            #can(:create, Medic) do |organization|
            #    permitted = organization.id === medic.organization_id
            #    permitted
            #end
        end
    end        
end    

