class NotificationPolicy < ApplicationPolicy
  def index?
    user&.admin?
  end

  def create?
    user&.admin?
  end

  def destroy?
    user&.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end