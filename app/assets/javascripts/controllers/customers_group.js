RapExample.CustomersController = Ember.Controller.extend({ });

RapExample.CustomersIndexController = Ember.Controller.extend({ 
  actions: {
    deleteVehicle: function (vehicle) {
      var _this = this;

      vehicle.deleteRecord();

      vehicle.save()
        .then(function () { })
        .catch(function (error) {
          vehicle.rollback();
        });
    }
  }
});

RapExample.CustomersShowController = Ember.Controller.extend({ });
