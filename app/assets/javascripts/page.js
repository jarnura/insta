App.room = App.cable.subscriptions.create("WebNotificationsChannel", {
  received: function(data) {
    return alert(data['message']);
  }
});