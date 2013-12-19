// For more information see: http://emberjs.com/guides/routing/

RapExample.Router.map(function () {
  this.resource('customers', function () {
    this.route('index', { path: '/customers' });
    this.route('new');
  });
});