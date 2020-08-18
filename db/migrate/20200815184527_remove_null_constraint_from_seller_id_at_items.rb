class RemoveNullConstraintFromSellerIdAtItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :items, :seller_id, true
  end
end
