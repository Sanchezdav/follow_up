class TaskCard::Component < ViewComponent::Base
  with_collection_parameter :task

  def initialize(task:)
    @task = task
  end

  def upcase_task_slug
    @task.slug.upcase
  end
end
