import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="dynamic-select"
export default class extends Controller {
  connect() {
    this.element.dataset.action = "change->dynamic-select#change"
  }

  change() {
    // get value of the select
    const value = this.element.value
    // get data-url from the select
    const url = this.element.dataset.url
    // fetch turbo-type from the select
    const turboType = this.element.dataset.turboType
    // create new url with the value
    this.url = (`${url}?type=${value}`)

    // replace the turbo-frame with the new url
    let frame = document.querySelector(`turbo-frame#${turboType}`)
    frame.src = this.url
    frame.reload()
  }
}
