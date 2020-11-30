# frozen_string_literal: true

class Members::Component < ViewComponent::Base
  def initialize(members:)
    @members = members
    @members_limit = 5
  end
end
