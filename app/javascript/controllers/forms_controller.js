import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'input',
    'submitButton',
    'errorsList',
  ]

  connect () {
    console.log('Forms controller connected!')
  }

  onSubmitError(event) {
    let [data, status, xhr] = event.detail;
    this.errorsListTarget.innerHTML = xhr.response;
    this.submitButtonTarget.classList.remove("disabled");
  }

  clean() {
    this.inputTarget.value = "";
    this.errorsListTarget.innerText = "";
  }

  // Example form ajax:success->form#onSubmitSuccess
  // onSubmitSuccess(event) {
  //   let [data, status, xhr] = event.detail;
  //   contentWrapper.insertAdjacentHTML("beforeend", xhr.response);
  //   cleanForm();
  //   this.submitButtonTarget.classList.remove("disabled");
  // }
}
