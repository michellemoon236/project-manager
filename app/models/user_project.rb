class UserProject < ApplicationRecord
  belongs_to :user 
  belongs_to :project

  def assign_project_creator(current_user)
    binding.pry
    self.project_creator = true if self.user_id == current_user.id
  end
end

