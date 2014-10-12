'use strict';

var settings = require('../settings');
var conduct = require('conduct.js');

conduct(
  {
    'media_queries':
    [
      {
        query: settings.breakpoints.mobile,
        match: function() {
          console.log('some other component entering mobile state');
          // This code will run when this media query moves from an unmatched state to a matched state
        },
        unmatch: function() {
          console.log('some other component leaving mobile state');
          // This code will run when this media query moves from a matched state to an unmatched state
        }
      },
      {
        query: settings.breakpoints.desktop,
        match: function() {
          console.log('some other component entering desktop state');
          // This code will run when this media query moves from an unmatched state to a matched state
        },
        unmatch: function() {
          console.log('some other component leaving desktop state');
          // This code will run when this media query moves from a matched state to an unmatched state
        }
      },
    ],
    'timeout': 300 // optional - default provided
  }
);

module.exports = function() {};
