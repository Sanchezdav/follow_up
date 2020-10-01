module Labelable
  extend ActiveSupport::Concern

  included do
    has_many :labels, -> { order(position: :asc) }, as: :labelable, dependent: :destroy
  end
end
