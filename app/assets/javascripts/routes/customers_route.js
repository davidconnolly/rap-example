RapExample.CustomersIndexRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('customer');
  },
  setupController: function(controller, model) {
    controller.set('customers', model);
  }
});
