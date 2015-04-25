'use strict';

var ajaxify_form = require('../modules/ajax-form');
var form_validator = require('../modules/form-validator');

var form = document.querySelectorAll('.form--contact')[0];

// Prevent the form from submitting naturally, we're gonna submit it with ajax
form.addEventListener('submit', function(e) {
  e.preventDefault();
});

form_validator({
  'form': form,
  'rules': [{
    name: '_replyto',
    display: 'required',
    rules: 'required'
  }],
  'success': function() {
    ajaxify_form(form, function (resp) {
      if('success' in resp) {
        form.reset();
      }
    });
  }
});


module.exports = function() {};
