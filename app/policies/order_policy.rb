class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
    # - record: the order passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
end
