import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    console.log("Sidebar controller connected!");
    console.log(this.cardTargets);
  }

  highlight(event) {
    // Remove 'selected' class from all card elements
    this.cardTargets.forEach((element) => {
      element.classList.remove("selected");
    });

    // Add 'selected' class to clicked card element
    event.currentTarget.classList.add("selected");
  }
}
