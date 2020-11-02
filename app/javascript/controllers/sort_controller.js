import Sortable from 'sortablejs'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['list']

  connect () {
    super.connect()
    console.log('Sort controller connected!')

    let sortable = Sortable.create(this.listTarget, {
      animation: 150,
      group: 'shared',
      ghostClass: 'sortable-ghost'
    })
  }

  drop(event) {
    let tasks = this.listTarget.children
    let parsedTasks = Array.from(tasks).map((task, index) => {
      return { id: task.dataset.taskId, position: (index + 1) }
    })

    this.listTarget.dataset.tasks = JSON.stringify(parsedTasks)
    this.stimulate('TaskReflex#sort', this.listTarget)
  }
}
