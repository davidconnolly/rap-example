RapExample.VehicleRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('vehicle', params.id);
  }
});
