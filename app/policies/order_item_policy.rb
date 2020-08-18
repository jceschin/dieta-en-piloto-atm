class OrderItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  #Para el tracking
  def create?
    true
  end

  #Para el tracking
  def edit?
    true
  end

  #Para el tracking
  def update?
    edit?
  end

  #Para el tracking
  def destroy?
    edit?
  end
end
