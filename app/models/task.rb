class Task < ApplicationRecord
  belongs_to :project
  validates :content, presence: true

  scope :completed, -> { where(complete: true) }
  scope :not_completed, -> { where(complete: false) }

  
end
