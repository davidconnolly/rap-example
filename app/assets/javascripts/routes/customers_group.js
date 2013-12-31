RapExample.CustomerRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('customer', params.id);
  }
});

RapExample.CustomersIndexRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('customer');
  },
  setupController: function(controller, model) {
    controller.set('customers', model);
  }
});

RapExample.CustomersNewRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.createRecord('customer');
  },
  setupController: function (controller, model, params) {
      controller.set('customer', model);
  },
  actions:{
    willTransition: function (transition) {
      var customer = this.modelFor('customers.new');
      if (customer.get('isDirty')) {
        customer.deleteRecord();
      }
      return true;
    }
  }
});
