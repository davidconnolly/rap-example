AutoMechanic.ApplicationSerializer = DS.ActiveModelSerializer;

AutoMechanic.ActiveModelAdapter = DS.ActiveModelAdapter.extend({});

AutoMechanic.Store = DS.Store.extend({
  adapter: AutoMechanic.ActiveModelAdapter
});