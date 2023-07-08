class Project < ApplicationRecord
  belongs_to :user
  
  validates :id_project, :id_user, presence: true
end
