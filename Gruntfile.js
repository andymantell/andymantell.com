// Grunt.js config
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-exec');

  // Project configuration.
  grunt.initConfig({

    compass: {
      dist: {
        options: {
          config: 'config.rb'
        }
      }
    },

    watch: {
      scss: {
        files: 'assets/**/*.scss',
        tasks: ['compass']
      },

      build: {
        files: [
          'site.*'
        ],
        tasks: ['build']
      }
    },

    exec: {
      transform: {
        cmd: 'xsltproc --stringparam outputpath ../dist/ site.xslt site.xml'
      }
    }
  });

  // Default task.
  grunt.registerTask('default', ['exec:transform', 'compass']);

  // Build
  grunt.registerTask('build', ['exec:transform']);

};
