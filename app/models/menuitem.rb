class Menuitem < ActiveRecord::Base
  belongs_to :menu

  def self.of_menu(menu)
    all.where(menu_id: menu.id)
  end
end
