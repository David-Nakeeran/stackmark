import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="bookmark-form"
export default class extends Controller {
  static targets = ["url", "title", "description"];

  connect() {}

  async fetchMetadata() {
    const url = this.urlTarget.value;
    const title = this.titleTarget;
    const description = this.descriptionTarget;
    if (title.value !== "") return;

    // TODO: valid url
    const response = await fetch(`/bookmarks/fetch_metadata?url=${url}`);
    const data = await response.json();

    title.value = data.title;
    description.value = data.description;
  }
}
