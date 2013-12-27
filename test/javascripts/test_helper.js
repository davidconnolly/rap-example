// Teaspoon includes some support files, but you can use anything from your own support path too.
// require support/sinon
// require support/your-support-file
//
// Deferring execution
// If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call Teaspoon.execute()
// after everything has been loaded. Simple example of a timeout:
//
// Teaspoon.defer = true
// setTimeout(Teaspoon.execute, 1000)
//
// Matching files
// By default Teaspoon will look for files that match _test.{js,js.coffee,.coffee}. Add a filename_test.js file in your
// test path and it'll be included in the default suite automatically. If you want to customize suites, check out the
// configuration in config/initializers/teaspoon.rb
//
// Manifest
// If you'd rather require your test files manually (to control order for instance) you can disable the suite matcher in
// the configuration and use this file as a manifest.
//
// For more information: http://github.com/modeset/teaspoon
//
// You can require javascript files here. A good place to start is by requiring your application.js.
//= require testing_hacks
//= require application
//= require_tree .
//= require_self

window.confirm = function (msg) {
  console.log(msg);
  return true;
}


document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>');
document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>');


RapExample.rootElement = '#ember-testing';
RapExample.setupForTesting();
RapExample.injectTestHelpers();

RapExample.safeReset = function () {
  this._readinessDeferrals = 1;

  function handleReset() {
    var router = this.__container__.lookup('router:main');
    router.reset();

    Ember.run(this.__container__, 'destroy');

    this.buildContainer();
    //this.setupApplication();
    Ember.run.schedule('actions', this, function () {
      this._initialize();
    });
  }

  Ember.run.join(this, handleReset);
}

function loginAs(email) {
  visit('/logout')
    .visit('/login')
    .fillIn('input.login-email', email)
    .fillIn('input.login-password', 'password')
    .click('.login-submit')
  visit('/')
}

function exists(selector) {
  return !!find(selector).length;
}

function hasContent(content) {
  return !!find('*:contains("' + content + '")').length;
}

function currentRoute() {
  return RapExample.__container__.lookup('controller:application').get('currentRouteName');
}

// RAILS_ENV=test rake teaspoon