class AddMenuIdToMenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :menu_id, :bigint
  end
end
