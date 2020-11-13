# frozen_string_literal: true

class TaskReflex < ApplicationReflex
  def update_status
    task = Task.friendly.find(element.dataset[:task_id])
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
    label = Label.friendly.find(element.dataset[:label_id])
    tasks.each do |task|
      task_record = Task.friendly.find(task['id'])
      task_record.update!(label: label, position: task['position'])
    end

    project = label.labelable
    target_id = "#project-#{project.slug}-board"
    renderer = ApplicationController.renderer.new(
      http_host: ENV['RAILS_APPLICATION_URL'].presence || 'http://my-domain.com:3000',
      https:     Rails.env.production?
    )

    cable_ready['project'].morph(
      selector: target_id,
      children_only: true,
      html: renderer.render(
        ProjectBoardComponent.with_collection(project.labels)
      )
    )
    cable_ready.broadcast
  end
end
