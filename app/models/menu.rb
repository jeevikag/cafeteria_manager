class Menu < ActiveRecord::Base
  has_many :menuitems

  def self.display
    " #{name}"
  end
end
