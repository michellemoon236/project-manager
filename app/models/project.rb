class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['content'].blank? }
end
