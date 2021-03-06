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

  def update_story_points
    task = Task.friendly.find(params[:id])
    task.update!(story_points: element.value)
  end

  def update_priority
    task = Task.friendly.find(params[:id])
    task.update!(priority: element.value)
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

    labels = project.labels.includes(tasks: :label).without_backlog

    cable_ready['project'].morph(
      selector: target_id,
      children_only: true,
      html: renderer.render(
        Board::Component.with_collection(labels)
      )
    )
    cable_ready.broadcast
  end

  def destroy
    task = Task.friendly.find(params[:id])
    task.discard
  end

  def restore
    task = Task.friendly.find(params[:id])
    task.undiscard
  end
end
