class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks

  validates :project_id, presence: true
  validates :url, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
