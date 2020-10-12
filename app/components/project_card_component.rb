class ProjectCardComponent < ViewComponent::Base
  def initialize(project:)
    @project = project
  end

  def created_at_formatted
    @project.created_at.strftime('%d/%m/%Y')
  end

  def tasks_count
    @project.tasks.count
  end
end
