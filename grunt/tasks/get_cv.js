var fs = require('fs-extra');
var Promise = require('es6-promise').Promise;
var cv = require('cv');

module.exports = function(grunt) {
  grunt.registerTask('get_cv', 'Get CV', function () {
    var done = this.async();

    Promise.all([cv.html, cv.pdf])
      .then(function(results) {

        // Generate CV page
        var cvPage = '';
        cvPage += '<page title="CV" path="cv"><region name="content">'
        cvPage += results[0];
        cvPage += '</region></page>';
        fs.writeFileSync('xml/cv.xml', cvPage);

        // Copy PDF version of the CV
        fs.copySync(results[1], 'dist/CV.pdf');

        done();
      });

  });
};
