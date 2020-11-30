# frozen_string_literal: true

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

  belongs_to :labelable, polymorphic: true, counter_cache: :tasks_count
  has_many :tasks, -> { order(position: :asc) }, inverse_of: :label, dependent: :destroy

  scope :without_backlog, -> { where.not('slug LIKE ?', '%backlog%') }

  def color
    case slug
    when /todo/ then 'bg-info'
    when /in-progress/ then 'bg-primary'
    when /qa/ then 'bg-warning'
    when /done/ then 'bg-success'
    else
      'bg-info'
    end
  end
end
