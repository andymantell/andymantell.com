'use strict';

var request = require('reqwest');
var form_serialize = require('form-serialize');

/**
 * Main function to send a form via ajax
 */
var ajaxify = function(form, success) {
  request({
    'url': form.action,
    'method': 'post',
    'type': 'json',
    'data': form_serialize(form),
    'crossOrigin': true,
    'success': success
  });
};

module.exports = ajaxify;
