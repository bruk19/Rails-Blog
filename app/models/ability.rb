# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Post
    elsif user.role == 'admin'
      can :manage, Post
    else
      can [:read, :create], Post
      can [:update, :destroy], Post, { Author_id: user.id }
    end
  end
end
