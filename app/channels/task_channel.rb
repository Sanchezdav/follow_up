class TaskChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'task'
  end
end
