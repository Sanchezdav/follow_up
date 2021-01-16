# frozen_string_literal: true

class TaskCard::Component < ViewComponent::Base
  include TaskHelper

  with_collection_parameter :task

  def initialize(task:)
    @task = task
  end

  def upcase_task_slug
    @task.slug.upcase
  end
end
