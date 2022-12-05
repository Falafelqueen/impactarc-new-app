import { Controller } from "@hotwired/stimulus"
import { Consumer } from "@rails/actioncable"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    userid: Number,
   }
  static targets = ["inbox", "lastMessage"]

  connect(){
    console.log(`subscribed for user ${this.useridValue}`);
    this.channel = createConsumer().subscriptions.create(
      { channel: "InboxChannel", user_id: this.useridValue },
      { received: data => this.inboxTarget.insertAdjacentHTML("beforeend", data)}
    )
  }
}
