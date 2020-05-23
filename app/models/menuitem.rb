class Menuitem < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :menu

  #def self.of_menu(menu)
  # all.where(menuitem_id: menuitem.id)
  #end
end
