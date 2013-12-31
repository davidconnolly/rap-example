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

Ember.RSVP.configure('onerror', function (error) {
  Ember.Logger.assert(false, error);
});
