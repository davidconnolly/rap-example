// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require handlebars
//= require ember
//= require ember-data
//= require ember-easyForm-v1.0.0.beta.1
//= require bootstrap-datepicker
//= require ember_override
//= require_self
//= require auto-mechanic
//
// For more details see: http://emberjs.com/guides/application/
window.AutoMechanic = Ember.Application.create({
 LOG_TRANSITIONS: true // basic logging of successful transitions
});

//Experimental feature
Ember.FEATURES['query-params'] = true;

var errorReceiver = function (error) {
  console.log(error);
  if (!window.isPhantomJS) {
    alert(error);
  }
};

Ember.onerror = errorReceiver;
Ember.RSVP.configure('onerror', errorReceiver);
