import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy"
export default class extends Controller {
  static targets = ["source", "icon"]
  connect() {
    this.iconTarget.dataset.action = "click->copy#copy"
  }

  copy() {
    navigator.clipboard.writeText(this.sourceTarget.innerText)
  }
}
