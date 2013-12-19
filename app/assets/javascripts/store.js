// http://emberjs.com/guides/models/defining-a-store/

RapExample.ApplicationSerializer = DS.ActiveModelSerializer;

RapExample.ActiveModelAdapter = DS.ActiveModelAdapter.extend({
});

RapExample.Store = DS.Store.extend({
  adapter: RapExample.ActiveModelAdapter
});