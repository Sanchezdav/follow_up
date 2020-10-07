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
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end