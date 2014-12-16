class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user
    alias_action :invest, :divest, :my_investments, :to => :has_money
    alias_action :submit, :withdraw, :my_projects, :to => :needs_money

    if user.admin?
      can :manage, :all
    elsif user.manager?
      can [:manage, :all], [Investment, Project]
    elsif user.investor?
      can [:read, :has_money], [Investment]
      can [:read], [Project]
    elsif user.provider?
      can [:manage, :needs_money], [Project]
      can [:show], [Investment]
    else
      can :read, :all
      can :read, Investment do |investment|
        investment.try(:user) == user
      end

      can :read, Project do |project|
        project.try(:user) == user
      end
    end
  end
end



