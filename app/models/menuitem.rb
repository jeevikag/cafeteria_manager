class Menuitem < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :menu
  has_many :orderitems

  #def self.of_menu(menu)
  # all.where(menuitem_id: menuitem.id)
  #end
end
