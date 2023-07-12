class Project < ApplicationRecord
  belongs_to :user

  validates :project_id, presence: true
  validates :url, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
