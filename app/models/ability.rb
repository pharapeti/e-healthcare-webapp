require 'cancan'

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    cannot :manage, :all
    if user.patient?
      can :manage, [Patient, Question]
    elsif user.doctor?
      can :manage, [Doctor, Answer]
    end
  end
end
