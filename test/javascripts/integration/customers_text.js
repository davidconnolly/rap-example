module("Integration - Customers test", {
  setup: function () {
    RapExample.safeReset();
  }
});

test("Visiting the application index route", function () {
  visit('/').wait()
    .then(function () {
      ok(hasContent('Jim\'s Auto Repair'), 'The index page did not render properly');
    });
});