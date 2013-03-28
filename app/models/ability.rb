class Ability
  include CanCan::Ability

    def initialize(donor)
    
        donor ||= Donor.new # guest user (not logged in)
        if donor.admin == false
            can [:read, :update], Donor, :donor_id => donor.id
            cannot [:create, :destroy], Donor
            can :read, Organization
            cannot [:create, :update, :destroy], Organization
            cannot [:create, :read, :update, :destroy], Medic
        else
            can :manage, :all
        end
    end    

     def initialize(user)
      user ||= Student.new
      can :create,Student
      can :read, Student , :id => user.id
      can :update, Student, :id => user.id
      can :destroy, Student, :id => user.id
      can :read, Registrar
      can :read, Schedule
      can :create, Application
      can :read, Application, :student_id => user.id
      can :edit, Application, :student_id => user.id
      can :destroy, Application, :student_id => user.id
      can :read, University
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
end
