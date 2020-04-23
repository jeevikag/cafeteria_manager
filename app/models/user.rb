class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :role, presence: true

  def of_user(user)
    all.where(user_id: user.id)
  end
end
