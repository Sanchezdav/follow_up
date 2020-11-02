# frozen_string_literal: true

class TaskReflex < ApplicationReflex
  def update_status
    task = Task.friendly.find(params[:id])
    label = Label.friendly.find(element.value)

    task.update!(label: label)
  end

  def update_assignee
    task = Task.friendly.find(params[:id])
    assignee = User.where(id: element.value).first || nil

    task.update!(assignee: assignee)
  end

  def sort
    tasks = JSON.parse(element.dataset[:tasks])
    tasks.each do |task|
      task_record = Task.friendly.find(task['id'])
      task_record.update!(position: task['position'])
    end
  end
end
