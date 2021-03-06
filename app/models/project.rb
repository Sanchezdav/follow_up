# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  name        :string           default(""), not null
#  slug        :string
#  tasks_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_projects_on_slug     (slug) UNIQUE
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Project < ApplicationRecord
  extend FriendlyId
  include Labelable

  friendly_id :name, use: :slugged

  MAIN_LABELS = ['Backlog', 'ToDo', 'In Progress', 'QA', 'Done'].freeze

  before_create :set_main_labels

  has_rich_text :description
  belongs_to :user
  has_many :tasks, through: :labels
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user, class_name: 'User', dependent: :destroy
  has_many :invites, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }

  private

  def set_main_labels
    MAIN_LABELS.each do |label|
      labels.new(name: label)
    end
  end
end
