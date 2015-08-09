var fs = require('fs');
var mkdirp = require('mkdirp');

module.exports = function(grunt) {
  grunt.registerTask('get_logo', 'Get logo', function () {
    var logo = require('logo');
    if(!fs.existsSync('dist/assets/img')) {
      mkdirp.sync('dist/assets/img');
    }
    fs.writeFileSync('dist/assets/img/logo.svg', logo);
  });
};
