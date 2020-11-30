# frozen_string_literal: true

class LabelsController < ApplicationController
  before_action :authenticate_user!
  before_action :project, only: :show
  before_action :label, only: :show

  def show
    @labels = @project.labels
  end

  private

  def project
    @project ||= current_user.projects.friendly.find(params[:project_id])
  end

  def label
    @label ||= project.labels.includes(tasks: :label).friendly.find(params[:id])
  end
end
