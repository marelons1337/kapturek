import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select"
export default class extends Controller {
  connect() {
    this.element.dataset.action = "change->select#filter"
  }

  filter() {
    const query = this.element.value
    window.location.href = query
  }
}
