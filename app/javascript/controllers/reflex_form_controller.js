import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['focus']

  submit (event) {
    event.preventDefault()
    this.stimulate(this.data.get('reflex'))
      .then(() => {
        this.element.reset()
        this.focusTarget.focus()
      })
  }
}
