// Setup twitter bootstrap look and feel for easyForm
Ember.EasyForm.Config.registerWrapper('twitter-bootstrap', {
  formClass: 'form-horizontal',
  fieldErrorClass: 'error',
  errorClass: 'help-inline',
  hintClass: 'help-block',
  labelClass: 'control-label',
  inputClass: 'control-group',
  wrapControls: true,
  controlsWrapperClass: 'controls'
});

var errorReceiver = function (error) {
  if (RapImsGon.is_development_mode) {
    console.log(error);
    if (!window.isPhantomJS) {
      alert(error);
    }
  }
};

Ember.onerror = errorReceiver;
Ember.RSVP.configure('onerror', errorReceiver);
