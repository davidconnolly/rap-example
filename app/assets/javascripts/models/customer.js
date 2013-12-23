RapExample.Customer = DS.Model.extend({
  name: DS.attr('string'),
  vehicles: DS.hasMany('vehicle', {async: true})
});
