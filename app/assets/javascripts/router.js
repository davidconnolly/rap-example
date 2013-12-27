RapExample.Router.map(function() {
    // this.resource('customers', function() {
    //   this.resource('customer', { path: '/:id' });
    // });
    this.resource('customers', function() {
      this.resource('customer', { path: ':id' });  
    });

    this.resource('vehicles', function() {
      this.resource('vehicle', { path: ':id' });
    });

  });
