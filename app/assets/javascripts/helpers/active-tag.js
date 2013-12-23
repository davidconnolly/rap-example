Ember.Handlebars.registerHelper('active-tag', function(name) {

  var options = [].slice.call(arguments, -1)[0],
    params = [].slice.call(arguments, 0, -1),
    hash = options.hash;

  hash.parameters = {
    context: this,
    options: options,
    params: params
  };

  return Ember.Handlebars.helpers.view.call(this, RapExample.ActiveItemView, options);
});
