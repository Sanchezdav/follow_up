import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'taskTitle',
    'taskDescription',
    'taskSubmit',
    'taskErrors',
  ]

  connect () {
    console.log('Projects controller connected!')
  }

  // add to form ajax:success->projects#onCreateTaskSuccess
  onCreateTaskSuccess(event) {
    let [data, status, xhr] = event.detail;
    let taskList = document.querySelector(
      `#tasks-list-${event.currentTarget.dataset.label}`
    );
    let taskModal = document.querySelector(
      `#task-modal-${event.currentTarget.dataset.label}`
    );
    let taskWrapper = document.querySelector(".modal-backdrop");

    taskList.insertAdjacentHTML("beforeend", xhr.response);
    cleanForm();
    this.taskSubmitTarget.classList.remove("disabled");
    taskModal.classList.remove('show')
    taskWrapper.classList.remove("show");
  }

  onCreateTaskError(event) {
    let [data, status, xhr] = event.detail;
    this.taskErrorsTarget.innerHTML = xhr.response;
    this.taskSubmitTarget.classList.remove('disabled')
  }

  cleanForm() {
    this.taskTitleTarget.value = "";
    this.taskDescriptionTarget.value = "";
    this.taskErrorsTarget.innerText = "";
  }
}
