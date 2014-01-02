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
      vehicles = customer.get('vehicles').then(function (object){
        customer.deleteRecord().save().then(function (object) {
          console.log(vehicles.toString())
          vehicles.forEach(function(vehicle){
            console.log(vehicle.get('id'));
          });
        });
      });
                  
      // var promises = {
      //   customer: customer.save(),
      //   vehicles: this.store.find('vehicle')
      // };

      // Ember.RSVP.hash(promises).then(function (objects) {
      //   console.log(objects.customer)
      //   console.log(objects.customer.id)
      //   console.log(vehicles.toString())

      //   // console.log(objects.vehicles)
      //   // console.log(objects.vehicles.filterBy( 'customer_id', customer.id))

      //   // objects.vehicles.forEach(function(vehicle){
      //   //   console.log(vehicle.id);
      //   // });

      // })
      // .catch(function (error) {
      //   customer.rollback();
      //   console.log(error);
      //   //vehicle.deleteRecord();
      // });

      // customer.save()
      //   .then(function () { 
      //     console.log(customer)
      //     console.log(customer.id)
      //     console.log()
      //   })
      //   .catch(function (error) {
      //     customer.rollback();
      //   });
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

