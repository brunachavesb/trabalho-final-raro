class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65535 }

  before_save :mark_as_edited, if: :finished_at_changed?

  private

  def mark_as_edited
    self.edited = true
  end
end
