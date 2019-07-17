class UserProject < ApplicationRecord
  belongs_to :user 
  belongs_to :project

  def add_project_creator(user_project)
    user_project.project_creator = true if user_project.user_id == current_user.id
  end
end
