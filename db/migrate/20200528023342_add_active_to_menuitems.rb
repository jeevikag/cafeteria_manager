class AddActiveToMenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :active, :boolean
  end
end
