class Task < ApplicationRecord
  belongs_to :project
  scope :completed, -> { where(complete: true) }
  scope :not_completed, -> { where(complete: false) }
end
