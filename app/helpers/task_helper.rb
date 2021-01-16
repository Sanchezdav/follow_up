# frozen_string_literal: true

module TaskHelper
  def priority_icon(priority)
    return '' unless priority

    {
      'trivial' => 'text-secondary fas fa-arrow-down',
      'minor' => 'text-muted fas fa-angle-double-down',
      'major' => 'text-info fas fa-angle-double-up',
      'blocker' => 'text-danger fas fa-ban'
    }[priority]
  end
end
