import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tickets"
export default class extends Controller {
  static targets = ["wrapper", "newPassenger", "passengerField"]
  connect() {
    console.log("Tickets controller connect", this.passengerFieldTarget)
  }

  addPassenger() {
    const clon = this.newPassengerTarget.content.cloneNode(true)
    this.wrapperTarget.appendChild(clon)
  }

  removePassenger() {
    if (this.passengerFieldTargets.length > 1) {
      this.passengerFieldTarget.remove();
    }
  }
}
