class RemovePriceFromMenuitems < ActiveRecord::Migration[6.0]
  def change

    remove_column :menuitems, :price, :integer
  end
end
