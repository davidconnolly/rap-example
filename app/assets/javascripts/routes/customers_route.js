RapExample.CustomersRoute = Ember.Route.extend({
  model: function() {
    return this.store.findAll('Customer');
  }
});
