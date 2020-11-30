# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_task_id  (task_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  belongs_to :task, counter_cache: true

  validate :content?

  private

  def content?
    return if content&.body&.present?

    errors.add(:content, "can't be blank")
  end
end
