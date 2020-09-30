# == Schema Information
#
# Table name: labels
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_labels_on_project_id  (project_id)
#  index_labels_on_slug        (slug)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Label < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_list scope: :project

  belongs_to :project, inverse_of: :labels

  def color
    case slug
    when 'backlog'
      'bg-info'
    when  'in-progress'
      'bg-primary'
    when 'qa'
      'bg-warning'
    when 'done'
      'bg-success'
    else
      'bg-info'
    end
  end
end
