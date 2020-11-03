class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :project, only: :show
  before_action :set_label, only: :create
  before_action :set_task, only: :show

  def show
    @members = @project.members
    @labels = @project.labels
    @comment = Comment.new
  end

  def create
    @task = @label.tasks.new(task_params)
    @task.label = Label.friendly.find(params[:status])
    @task.reporter = current_user
    @task.save

    if @task.errors.any?
      render partial: 'shared/errors', locals: { resource: @task }, status: :unprocessable_entity
    else
      redirect_to @project
    end
  end

  private

  def project
    @project ||= current_user.collaborations.friendly.find(params[:project_id])
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
