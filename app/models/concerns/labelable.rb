# frozen_string_literal: true

module Labelable
  extend ActiveSupport::Concern

  included do
    has_many :labels, -> { order(position: :asc) }, as: :labelable,
             inverse_of: :labelable, dependent: :destroy
  end
end
