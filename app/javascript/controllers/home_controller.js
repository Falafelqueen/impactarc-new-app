import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["something"]

  connect(){
    console.log("Stimulus connected");
  }
  printToConsole() {
    console.log(this.somethingTarget.value)
  }
}
