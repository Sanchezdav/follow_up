import CableReady from 'cable_ready'
import consumer from "./consumer"

consumer.subscriptions.create("ProjectChannel", {
  connected() {
    console.log("Connected to the project room!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
});
