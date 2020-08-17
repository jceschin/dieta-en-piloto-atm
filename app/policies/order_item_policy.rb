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
    o = Order.find_by(id:record.order_id)
    i = Item.find_by(id: record.item_id)
    s = Seller.find_by(id: i.seller_id)
    o.status == "personal" && o.user_id == user.id && i.origin == "user" && s.name = "user" && s.description == user.email
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
