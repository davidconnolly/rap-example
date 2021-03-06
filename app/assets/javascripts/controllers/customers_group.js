AutoMechanic.CustomersController = Ember.Controller.extend({ });

AutoMechanic.CustomersIndexController = Ember.Controller.extend({
  actions: {
    deleteVehicle: function (vehicle) {
      vehicle.deleteRecord();
      vehicle.save()
        .then(function () { })
        .catch(function (error) {
          vehicle.rollback();
        });
    },
    deleteCustomer: function (customer) {
      var vehicles = customer.get('vehicles');

      vehicles.then(function (){
        vehicles.forEach(function(vehicle){
          vehicle.unloadRecord();
        });

        customer.deleteRecord()
        customer.save()
          .then(function () { })
          .catch(function (error) {
            customer.rollback();
          });
      });
    }
  }
});

AutoMechanic.CustomersShowController = Ember.Controller.extend({ });

AutoMechanic.CustomersNewController = Ember.Controller.extend({
  needs: ['customers'],
  isNew: true,

  actions: {
    submit: function () {
      var _this = this;
      var customer = this.get('customer');

      customer.save()
        .then(function (object) {
          _this.transitionToRoute('customers');
        })
        .catch(function (error) {
          customer.rollback();
        });
    }
  }
});

