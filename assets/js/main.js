'use strict';

/**
 * Breakpoint specific functionality
 */
var conduct = require('conduct.js');
conduct(
  {
    'media_queries':
    [
      {
        query: '(max-width: 600px)',
        match: function() {
          // This code will run when this media query moves from an unmatched state to a matched state
        },
        unmatch: function() {
          // This code will run when this media query moves from a matched state to an unmatched state
        }
      },
      {
        query: '(min-width: 601px)',
        match: function() {
          // This code will run when this media query moves from an unmatched state to a matched state
        },
        unmatch: function() {
          // This code will run when this media query moves from a matched state to an unmatched state
        }
      },
    ],
    'timeout': 300 // optional - default provided
  }
);


/**
 * Global functionality
 */
var ajax_form = require('./modules/ajax-form');
ajax_form(document.querySelectorAll('.js-ajaxify-form'));
