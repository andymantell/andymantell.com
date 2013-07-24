// Grunt.js config
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');

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
      }
    }
  });

  // Default task.
  grunt.registerTask('default', []);

  grunt.registerTask('scss', ['compass']);

};
