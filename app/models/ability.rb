class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new #guest user
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
    end

    # if user.role?(:manager)
    #   can [:create, :update, :destroy], Investment, Project
      # can :update, Investment do |investment|
      #   investment.try(:user) == user
      # end
    end
  end

