class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :projects

  validates :name, :email, presence: true
  validates :name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
end
