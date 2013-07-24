// Grunt.js config
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-jekyll');

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
          'jekyll/**/*.*'
        ],
        tasks: ['jekyll', 'compass']
      }
    },

    jekyll: {
      dist: {
        config: '_config.yml'
      }
    }
  });

  // Default task.
  grunt.registerTask('default', ['jekyll', 'compass']);

  grunt.registerTask('scss', ['compass']);

};
