# frozen_string_literal: true

module ProjectHelper
  def edit_button(project:, user:)
    return unless user == current_user

    link_to(edit_project_path(project)) do
      tag(:i, '', class: 'fas fa-pencil-alt')
    end
  end
end
