class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

  end

  def new?
    user
  end

  def create?
    new?
  end

  def edit?
    s = Seller.find_by(id:record.seller_id)
    record.origin == "user" && s.name == "user" && s.description == user.email
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
