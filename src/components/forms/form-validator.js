'use strict';

var validate = require('validate-js');

module.exports = function(config) {

  var validator = new validate(config.form, config.rules, function(errors) {
      if (errors.length > 0) {
        errors.forEach(function(error) {
          console.log(error);
        });
      } else {
        config.success();
      }
    }
  );

};
