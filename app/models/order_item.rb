class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menuitem
  def self.ordered_items(id)
    OrderItem.all.where(order_id: id)
  end
end
