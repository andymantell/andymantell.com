'use strict';

var request = require('reqwest');
var form_serialize = require('form-serialize');

/**
 * Main function to ajaxify a form
 */
var ajaxify = function(form) {
  form.addEventListener('submit', function(e) {
    e.preventDefault();

    request({
      url: form.action,
      method: 'post',
      type: 'json',
      data: form_serialize(form),
      crossOrigin: true,
      success: function (resp) {
        if('success' in resp) {
          form.reset();
        }
      }
    });

  });
};

module.exports = function(elements) {

  if(elements instanceof NodeList) {
    for (var i = 0; i < elements.length; ++i) {
      ajaxify(elements[i]);
    }
  } else {
    ajaxify(elements);
  }

};
