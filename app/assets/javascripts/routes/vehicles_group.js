RapExample.VehicleRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('vehicle', params.id);
  }
});

RapExample.VehiclesIndexRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('vehicle');
  },
  setupController: function(controller, model) {
    controller.set('vehicles', model);
  }
});

RapExample.VehiclesNewRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.createRecord('vehicle');
  },
  setupController: function (controller, model) {
    var promises = [ ];
    var customers = this.store.find('customer');
    promises.push(customers);

    Ember.RSVP.all(promises).then(function(objects){
      controller.set('customers', objects[0]);
      controller.set('vehicleCustomerListener', objects[0].get('lastObject'))
    });

    controller.set('vehicle', model);
  }
});
