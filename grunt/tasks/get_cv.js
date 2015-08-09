var fs = require('fs-extra');
var Promise = require('es6-promise').Promise;
var cv = require('cv');

module.exports = function(grunt) {
  grunt.registerTask('get_cv', 'Get CV', function () {
    var done = this.async();

    Promise.all([cv.html, cv.pdf])
      .then(function(results) {

        // Generate CV page
        var markdown = results[0];
        var cvPage = '';

        // Strip out the h1 tag
        markdown = markdown.replace(/<h1 id=".*">.*<\/h1>/, '');

        // Build up the xml for the page
        cvPage += '<page title="CV" path="cv">';
        cvPage += '<region name="content">';
        cvPage += markdown;
        cvPage += '</region>';
        cvPage += '<region name="sidebar-right">';
        cvPage += '<a href="/CV.pdf" class="button">Download CV</a>';
        cvPage += '</region>';
        cvPage += '</page>';
        fs.writeFileSync('xml/cv.xml', cvPage);

        // Copy PDF version of the CV
        fs.copySync(results[1], 'dist/CV.pdf');

        done();
      });

  });
};
