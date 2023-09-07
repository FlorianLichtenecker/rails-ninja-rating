import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal-add-review-button"
export default class extends Controller {
  static targets = ["transparentCard"]

  addDiv() {

    // this.transparentCardTargets.forEach(target => {
    //   console.log(target)
    //   target.classList.remove("d-none");
    // });


  }
}
