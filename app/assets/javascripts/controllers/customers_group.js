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
    },
    deleteCustomer: function (customer) {
      var _this = this;
      
      customer.deleteRecord();

      customer.save()
        .then(function () { })
        .catch(function (error) {
          customer.rollback();
        });
    }
  }
});

RapExample.CustomersShowController = Ember.Controller.extend({ });

RapExample.CustomersNewController = Ember.Controller.extend({ 
  needs: ['customers'],
  isNew: true,

  actions: {
    submit: function () {
      var _this = this;
      var customer = this.get('customer');

      if (customer.get('errors')) {
        customer.set('errors', null);
        customer.send('becameValid');
      }

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

