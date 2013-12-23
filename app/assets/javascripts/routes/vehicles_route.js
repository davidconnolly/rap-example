RapExample.VehiclesRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('vehicle');
  },
  setupController: function(controller, model) {
    window.mv = model
    controller.set('model', model);
  }
});
