# frozen_string_literal: true

class Board::Component < ViewComponent::Base
  with_collection_parameter :label

  def initialize(label:)
    @label = label
  end
end
