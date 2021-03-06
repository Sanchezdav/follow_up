# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :project, except: %i[index new create]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.collaborations.includes(:tasks)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @task = Task.new
    @invite = @project.invites.new

    all_labels = @project.labels
    @members = @project.members.limit(5).order(created_at: :asc)
    @labels = all_labels.includes(:labelable, tasks: :label).without_backlog
    @backlog = all_labels.find_by(name: 'Backlog')
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        @project.project_members.create(user: current_user, owner: true)

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deprecated_tasks
    @tasks = @project.tasks.discarded
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def project
    @project ||= Project.includes(
      labels: [tasks: [assignee: :avatar_attachment]]
    ).friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
