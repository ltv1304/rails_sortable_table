import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "column" ]
  static classes = [ "dir" ]

  clear(e) {
    this.columnTargets.forEach((element, index) => {
      if (element != e.target){
        element.classList.remove(...this.dirClasses)
        element.dataset.columnIndexValue = '2'
      }
    })
  }
}
