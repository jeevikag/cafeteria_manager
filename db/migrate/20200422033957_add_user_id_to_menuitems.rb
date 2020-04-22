class AddUserIdToMenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :user_id, :bigint
  end
end
