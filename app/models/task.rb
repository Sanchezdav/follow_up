# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  position   :integer
#  slug       :string
#  title      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_label_id  (label_id)
#  index_tasks_on_slug      (slug)
#
# Foreign Keys
#
#  fk_rails_...  (label_id => labels.id)
#
class Task < ApplicationRecord
  extend FriendlyId
  friendly_id :uuid, use: :slugged
  acts_as_list scope: :label

  has_rich_text :description
  belongs_to :label

  validates :title, presence: true, length: {minimum: 2, maximum: 50}
  validate :has_description

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
