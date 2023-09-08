import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["card","panel", "toggleButton", "mainContentArea"];

  connect() {
    console.log("Sidebar controller connected!");
  }

  highlight(event) {
    // Remove 'selected' class from all card elements
    this.cardTargets.forEach((element) => {
      element.classList.remove("selected");
    });

    // Add 'selected' class to clicked card element
    event.currentTarget.classList.add("selected");
  }

  togglePanel() {
    this.panelTarget.classList.toggle("active");
    this.toggleButtonTarget.classList.toggle("selected");

    const mainContentElement = document.querySelector('[data-controller="main-content"]');
    if (mainContentElement) {
      mainContentElement.setAttribute('data-main-content-dimmed-value', 'true');
    }
  }

  closeSlideInPanel() {
    this.panelTarget.classList.remove("active");
    this.toggleButtonTarget.classList.remove("selected");

    const mainContentElement = document.querySelector('[data-controller="main-content"]');
    if (mainContentElement) {
      mainContentElement.setAttribute('data-main-content-dimmed-value', 'false');
    }
  }
}
