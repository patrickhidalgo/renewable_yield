class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new #guest user
    if user.role? :admin
      can :manage, :invest, :all
    elsif user.role?(:manager)
      can [:read, :create, :update, :destroy], Investment, Project
    elsif user.role?(:investor)
      can [:read, :invest, :divest], Investment
    elsif user.role?(:provider)
      can [:read, :submit, :update, :withdraw], Project
    else
      can :read, :all
    end

    can :read, Investment do |investment|
      investment.try(:user) == user
    end

    can :read, Project do |project|
      project.try(:user) == user
    end
  end
end



