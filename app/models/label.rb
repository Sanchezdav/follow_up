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
class Label < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_list scope: :labelable

  belongs_to :labelable, polymorphic: true
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  def color
    case slug
    when /backlog/
      'bg-info'
    when  /in-progress/
      'bg-primary'
    when /qa/
      'bg-warning'
    when /done/
      'bg-success'
    else
      'bg-info'
    end
  end
end
