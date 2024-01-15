import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-visibility"
export default class extends Controller {
  static targets = [
    "input",
  ]

  toggle() {
    this.inputTarget.type = this.inputTarget.type === "password" ? "text" : "password"
  }
}
