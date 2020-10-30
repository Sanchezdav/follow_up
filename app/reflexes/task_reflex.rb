# frozen_string_literal: true

class TaskReflex < ApplicationReflex
  def update_status
    task = Task.friendly.find(params[:id])
    label = Label.friendly.find(element.value)

    task.update!(label: label)
  end

  def update_assignee
    task = Task.friendly.find(params[:id])
    assignee = User.find(element.value)

    task.update!(assignee: assignee)
  end
end
