# frozen_string_literal: true

class Board::Component < ViewComponent::Base
  include LabelHelper

  with_collection_parameter :label

  def initialize(label:)
    @label = label
  end
end
