class RemoveMenuitemPriceFromOrderItems < ActiveRecord::Migration[6.0]
  def change

    remove_column :order_items, :menuitem_price, :integer
  end
end
