class Menu < ActiveRecord::Base
  validates :name, presence: true
  has_many :menuitems

  def self.display
    " #{name}"
  end
end
