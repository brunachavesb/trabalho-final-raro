class Task < ApplicationRecord
  attr_accessor :elapsed_time

  belongs_to :project

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65535 }
  before_save :mark_as_edited, if: :finished_at_changed?
  before_update :update_finished_at, if: -> { elapsed_time.present? }

  def elapsed_time
    return unless started && finished && started_at && finished_at

    (finished_at - started_at).seconds
  end

  def elapsed_time=(new_elapsed_time)
    @elapsed_time = new_elapsed_time.to_i
    self.finished_at = self.started_at + @elapsed_time.seconds if self.started_at
  end

  private

  def mark_as_edited
    self.edited = true
  end

  def update_finished_at
    self.finished_at = started_at + @elapsed_time.seconds if @elapsed_time && started_at
  end
end
