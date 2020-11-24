# == Schema Information
#
# Table name: tasks
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0)
#  discarded_at   :datetime
#  position       :integer
#  priority       :string
#  slug           :string
#  story_points   :integer
#  title          :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assignee_id    :integer
#  label_id       :bigint           not null
#  reporter_id    :integer
#
# Indexes
#
#  index_tasks_on_assignee_id   (assignee_id)
#  index_tasks_on_discarded_at  (discarded_at)
#  index_tasks_on_label_id      (label_id)
#  index_tasks_on_reporter_id   (reporter_id)
#  index_tasks_on_slug          (slug)
#
# Foreign Keys
#
#  fk_rails_...  (label_id => labels.id)
#
class Task < ApplicationRecord
  extend FriendlyId
  include Discard::Model
  friendly_id :uuid, use: :slugged
  acts_as_list scope: :label

  has_rich_text :description
  belongs_to :label
  belongs_to :reporter, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2, maximum: 50}
  validate :has_description

  enum priority: {
    trivial: 'trivial',
    minor: 'minor',
    major: 'major',
    blocker: 'blocker'
  }

  def priority_icon
    return '' unless priority

    case priority
    when 'trivial' then 'text-secondary fas fa-arrow-down'
    when 'minor' then 'text-muted fas fa-angle-double-down'
    when 'major' then 'text-info fas fa-angle-double-up'
    when 'blocker' then 'text-danger fas fa-ban'
    end
  end

  private

  def has_description
    unless description&.body&.present?
      errors.add(:description, "can't be blank")
    end
  end

  def uuid
    return SecureRandom.uuid unless label.labelable.class.name == 'Project'

    "#{label.labelable.name[0..2]}-#{SecureRandom.hex(4)}"
  end
end
