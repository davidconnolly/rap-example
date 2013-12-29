// RapExample.Router.reopen({
//   location: 'history'
// });

// RapExample.Router.map(function() {
//   this.resource('customers', function() {
//     this.resource('customer', { path: ':id' });
//   });

//   this.resource('vehicles', function() {
//     this.resource('vehicle', { path: ':id' });
//   });
// });

RapExample.Router.map(function() {

  this.resource('customers', function() {
    this.route('index', { path: '/'});
  });
  
  this.resource('vehicles', function() {
    this.route('index', { path: '/'});
  });
});
