class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
end
