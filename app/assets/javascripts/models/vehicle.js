RapExample.Vehicle = DS.Model.extend({
  make: DS.attr('string'),
  year: DS.attr('number'),
  customer: DS.belongsTo('customer', {async: true})
});
