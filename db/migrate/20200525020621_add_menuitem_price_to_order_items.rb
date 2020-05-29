class AddMenuitemPriceToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :menuitem_price, :float
  end
end
