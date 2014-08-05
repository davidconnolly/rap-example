RapExample.VehiclesController = Ember.Controller.extend({ });

RapExample.VehiclesIndexController = Ember.Controller.extend({ });

RapExample.VehiclesShowController = Ember.Controller.extend({ });

RapExample.VehiclesNewController = Ember.Controller.extend({
  needs: ['vehicles'],
  isNew: true,
  vehicleCustomerListener: undefined,
  updateVehicleCustomerListener: function () {
    if (this.get('vehicleCustomerListener')) {
      this.set('vehicle.customer', this.get('vehicleCustomerListener'));
    }
  }.observes('vehicleCustomerListener'),

  actions: {
    submit: function () {
      var _this = this;
      var vehicle = this.get('vehicle');

      vehicle.save()
        .then(function (object) {
          _this.transitionToRoute('customers');
        })
        .catch(function (error) {
          vehicle.rollback();
        });
    }
  }
});
