class AddPriceToMenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :price, :float
  end
end
