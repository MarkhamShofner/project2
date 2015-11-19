class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user
      can :create, Retreat
      if user.admin
        can :manage, All
      end
    end

    can [:update, :destroy], [Retreat, Comment], :user => user

  end
end
