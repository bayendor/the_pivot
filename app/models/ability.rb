class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Category

    if user.is_a_tenant?
      can :manage, Tenant, id: user.tenant_id
      can :read, LoanRequest
      can :update, LoanRequest, user_id: user.id
      can :create, LoanRequest, user_id: user.id
      can :manage, User, id: user.id
    else
      can :create, Tenant
      can :read, Tenant
      can :read, LoanRequest
      can :update, LoanRequest
      can :manage, User, id: user.id
    end
  end
end
