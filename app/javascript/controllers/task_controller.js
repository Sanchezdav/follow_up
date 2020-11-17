import ApplicationController from './application_controller'

export default class extends ApplicationController {
  connect () {
    super.connect()
  }

  update_status(event) {
    this.stimulate('Task#update_status', event.currentTarget)
  }

  update_assignee(event) {
    this.stimulate('Task#update_assignee', event.currentTarget)
  }

  update_story_points(event) {
    this.stimulate('Task#update_story_points', event.currentTarget)
  }

  update_priority(event) {
    this.stimulate('Task#update_priority', event.currentTarget)
  }
}
