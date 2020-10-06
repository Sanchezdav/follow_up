class TasksController < ApplicationController
  before_action :set_label, only: :create

  def create
    @task = @label.tasks.new(task_params)
    @task.label = Label.friendly.find(params[:status])
    @task.save

    if @task.errors.any?
      render partial: 'errors', locals: { task: @task }, status: :unprocessable_entity
    else
      redirect_to @project
    end
  end

  private

  def set_label
    @project = current_user.projects.friendly.find(params[:project_id])
    @label = @project.labels.friendly.find(params[:status])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
