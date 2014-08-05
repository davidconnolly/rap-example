AutoMechanic.ApplicationRoute = Ember.Route.extend({
  actions: {
    error: function(error, transition) {
      // handle the error
      console.log(error.message);
    }
  }
});
