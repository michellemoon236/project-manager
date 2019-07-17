class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['content'].blank? }

  validates :name, :description, presence: true
  validates :user_ids, presence: { message: ": At least one team member must be selected" }

end


# params.require(:project).permit(
#   :name,
#   :description,
#   tasks_attributes:[:content, :complete, :project_id, :id],
#   user_ids:[]
# )