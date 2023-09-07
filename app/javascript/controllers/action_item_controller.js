import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"];
  connect(){
    console.log("Action items")
  }
  display(event){
    this.formTarget.classList.toggle("d-none")
    if (event.currentTarget.innerText === "Add Action Items"){
      event.currentTarget.innerText = "Close"
    }
    else {
      event.currentTarget.innerText = "Add Action Items"
    }
  }
}
