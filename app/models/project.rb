class Project < ApplicationRecord
  validates :id_project, :id_user, presence: true
end
