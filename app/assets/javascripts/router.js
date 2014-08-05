// AutoMechanic.Router.reopen({
//   location: 'history'
// });

AutoMechanic.Router.map(function() {

  this.resource('customers', function() {
    this.route('index', { path: '/'});
    this.route('new', { path: '/new' });
  });

  this.resource('vehicles', function() {
    this.route('index', { path: '/'});
    this.route('new', { path: '/new', queryParams: ['customer_id'] });
  });
});
