RapExample.VehiclesRoute = Ember.Route.extend({
  model: function(params) {
    window.vm = this
    return this.store.find('vehicle');
  },
  setupController: function(controller, model) {
    controller.set('model', model);
  }
});
