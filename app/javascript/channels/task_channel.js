import CableReady from 'cable_ready'
import consumer from "./consumer"

consumer.subscriptions.create("TaskChannel", {
  connected() {
    console.log("Connected to the task room!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
});
