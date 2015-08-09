var fs = require('fs');
var Promise = require('es6-promise').Promise;
var cv = require('cv');

module.exports = function(grunt) {
  grunt.registerTask('get_cv', 'Get CV', function () {
    var done = this.async;

    Promise.all([cv.html, cv.pdf])
      .then(function(results) {
        console.log(results);
      });

  });
};
