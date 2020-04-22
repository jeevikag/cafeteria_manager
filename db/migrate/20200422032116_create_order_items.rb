class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :menuitem_id
      t.string :menuitem_name
      t.integer :menuitem_price
    end
  end
end
