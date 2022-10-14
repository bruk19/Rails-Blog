class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user.role == 'admin'
      can :manage, :all
    else
      can %i[read create], :all
      can %i[update destroy], :all, { Author_id: user.id }
    end
  end
end
