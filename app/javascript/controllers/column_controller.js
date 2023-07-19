import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="column"
export default class extends Controller {
  static classes = [ "dir" ]
  static values = { index: { type: Number, default: 2 } }

  next() {
    this.indexValue  += 1;
    let index = this.indexValue % 3
    console.log(22)
    fetch('http://127.0.0.1:3000/wfile?test=42')
      .then(response => response.text())
      .then(data => console.log(data));
      console.log(22)
    switch (index){
      case 0:
        this.element.classList.add(this.dirClasses[index])
        this.dispatch('clear')
        break;
      case 1:
        this.element.classList.remove(this.dirClasses[index-1])
        this.element.classList.add(this.dirClasses[index])
        break;
      case 2:
        this.element.classList.remove(this.dirClasses[index-1])
        break;
    }
  }
}
