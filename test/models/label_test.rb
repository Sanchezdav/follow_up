# == Schema Information
#
# Table name: labels
#
#  id             :bigint           not null, primary key
#  labelable_type :string
#  name           :string
#  position       :integer
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  labelable_id   :bigint
#
# Indexes
#
#  index_labels_on_labelable_type_and_labelable_id  (labelable_type,labelable_id)
#  index_labels_on_slug                             (slug)
#
require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
