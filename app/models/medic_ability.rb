class MedicAbility
  include CanCan::Ability

    def initialize(medic)
        if medic.admin == true
            can :manage, :all
        end
    end        
end    

