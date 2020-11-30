# frozen_string_literal: true

# == Schema Information
#
# Table name: project_members
#
#  id         :bigint           not null, primary key
#  owner      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_project_members_on_project_id  (project_id)
#  index_project_members_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
class ProjectMember < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
