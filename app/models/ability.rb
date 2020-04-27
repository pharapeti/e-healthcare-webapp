require 'cancan'

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    cannot :manage, :all
    if user.patient?
      can :manage, [Question]
    elsif user.doctor?
      can :manage, [Answer]
    end
  end
end
