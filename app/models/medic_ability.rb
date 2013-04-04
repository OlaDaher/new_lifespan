class MedicAbility
  include CanCan::Ability

    def initialize(medic)
        if medic.admin == true
            can [:show, :update, :destroy], Medic, :id => medic.id
            can :create, Medic, :organization_id == medic.organization_id
        end
    end        
end    

