class TasksController < ApplicationController
  before_action :set_label, only: :create
  before_action :set_task, only: :show

  def show
  end

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

  def project
    @project ||= current_user.projects.friendly.find(params[:project_id])
  end

  def set_label
    @label = project.labels.friendly.find(params[:status])
  end

  def set_task
    @task = project.tasks.friendly.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
