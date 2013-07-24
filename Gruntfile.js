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
        files: 'src/assets/**/*.scss',
        tasks: ['compass']
      },

      build: {
        files: [
          'src/**/*.*',
          '!src/assets/**/*.*'
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
