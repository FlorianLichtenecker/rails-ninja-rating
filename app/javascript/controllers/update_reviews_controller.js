import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-reviews"
export default class extends Controller {
  connect() {
    console.log("Here I am!")
  }
}
