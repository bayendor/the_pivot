class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new


    if user.is_a_tenant?
      can :manage, Tenant, id: user.tenant_id
      can :read, LoanRequest
      can :update, LoanRequest, user_id: user.id
      can :create, LoanRequest, user_id: user.id
      can :manage, User, id: user.id
      can :read, Category
    else
      can :create, Tenant
      can :read, Tenant
      can :read, LoanRequest
      can :update, LoanRequest
      can :manage, User, id: user.id
      can :read, Category
    end
  end
end
