import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

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
    // fetch the url with turbostream
    this.url = (`${url}?type=${value}`)

    let frame = document.querySelector(`turbo-frame#${turboType}`)
    frame.src = this.url
    frame.reload()
  }
}
