import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["messagesPanel"];

  connect() {
    console.log("MessagesPanelController#connect");
    this.scrollToBottom();
  }

  scrollToBottom() {
    this.messagesPanelTarget.scrollTop = this.messagesPanelTarget.scrollHeight;
  }
}
