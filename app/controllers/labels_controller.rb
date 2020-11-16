class LabelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_label, only: :show

  def show
    @labels = project.labels
  end

  private

  def project
    @project ||= current_user.projects.friendly.find(params[:project_id])
  end

  def set_label
    @label ||= project.labels.friendly.find(params[:id])
  end
  
end