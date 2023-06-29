class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nome, :email, presence: true
  validates :nome, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
end
