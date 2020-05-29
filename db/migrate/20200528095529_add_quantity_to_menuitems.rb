class AddQuantityToMenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :quantity, :integer
  end
end
