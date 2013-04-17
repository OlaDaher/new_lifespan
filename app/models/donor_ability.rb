class DonorAbility
  include CanCan::Ability

    def initialize(donor)
        donor ||= Donor.new # guest user (not logged in)
        can :create, Donor
        can [:show, :update, :destroy], Donor, :id => donor.id
        cannot :manage, Medic
        cannot [:create, :update, :destroy], Organization
        can :confirm_account, Donor
        if donor.id.nil? == false
            can [:read, :show], Organization
            cannot :create, Organization
            cannot :create, Donor
            cannot :manage, Medic
        end    
        if donor.admin == true
            can :manage, :all
            cannot :update, Medic
            cannot :update, Donor
        end
    end        

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  
end
