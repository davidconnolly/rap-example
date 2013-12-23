RapExample.ActiveItemView = Ember.LinkView.extend({
  tagName: 'li',
  activeClass: 'active',
  click: function() {
    return false;
  },

  _invoke: function() {
    return true;
  },

  active: Ember.computed(function() {
    var paths = this.get('path').split(',');

    if (Ember.get(this, 'loading')) { return false; }
    var router    = Ember.get(this, 'router'),
      routeArgs = Ember.get(this, 'routeArgs'),
      contexts  = routeArgs.slice(1),
      resolvedParams = Ember.get(this, 'resolvedParams');

    var isActive = false;
    paths.forEach(function(item, index) {
      var currentWhen = item;
      var currentWithIndex = item + '.index';
      var foundMatch = router.isActive.apply(router, [currentWhen].concat(contexts)) || router.isActive.apply(router, [currentWithIndex].concat(contexts));
      if(foundMatch) {
        isActive = true;
      }
    });

    if(isActive) {
      return Ember.get(this, 'activeClass');
    }
  }).property('resolvedParams', 'routeArgs', 'router.url')

});