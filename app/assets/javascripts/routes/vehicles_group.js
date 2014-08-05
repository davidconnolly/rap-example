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
  setupController: function (controller, model, params) {
    var _this = this;

    controller.set('customers', undefined);
    controller.set('vehicle', undefined);
    controller.set('vehicleCustomerListener', undefined);

    this.store.find('customer').then(function (customers) {
      controller.set('customers', customers);
      controller.set('vehicle', model);
      controller.set('vehicleCustomerListener', customers.get('lastObject'));

      if (params.customer_id) {
        var customer = _this.store.find('customer', params.customer_id);
        customer.then(
          function (object) {
            controller.set('vehicleCustomerListener', object);
          },
          function () {
            //customer is not found
          }
        );
      }
    });
  },

  actions:{
    willTransition: function (transition) {
      var vehicle = this.modelFor('vehicles.new');
      if (vehicle.get('isDirty')) {
        vehicle.deleteRecord();
      }
      return true;
    }
  }
});

