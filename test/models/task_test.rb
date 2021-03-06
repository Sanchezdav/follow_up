# frozen_string_literal: true

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
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
