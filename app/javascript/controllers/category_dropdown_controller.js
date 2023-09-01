import { Controller } from "@hotwired/stimulus"
import "select2"

// Connects to data-controller="category-dropdown"
export default class extends Controller {
  connect() {
    $('.select2-enable').select2({
      placeholder: 'Add review categories',
      allowClear: true
    });
  }
}
