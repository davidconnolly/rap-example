RapExample.VehiclesRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('vehicle');
  }
});
