import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select"
export default class extends Controller {
  params = new URLSearchParams(window.location.search)
  connect() {
    this.element.dataset.action = "change->select#filter"
    this.element.value = this.params.get('sort')
  }

  filter() {
    const query = this.element.value
    this.params.set('sort', query)
    window.location.search = this.params.toString()
  }
}
