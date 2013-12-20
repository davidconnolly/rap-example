RapExample.CustomersRoute = Ember.Route.extend({
  model: function(params) {
    debugger
    RapExample.Customer.find();
  }
});