class Ability
  include 'cancan'

  def initialize(user)
    can :read, :all
  end
end
