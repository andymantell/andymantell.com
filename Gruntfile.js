// Grunt.js config
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-exec');
  grunt.loadNpmTasks('grunt-awssum-deploy');

  // Project configuration.
  grunt.initConfig({

    awsSettings: grunt.file.readJSON('aws.json'),

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
          'xml/**/*.*',
          'xslt/**/*.*'
        ],
        tasks: ['build']
      }
    },

    s3deploy: {
      options: {
        key: '<%= awsSettings.accessKeyId %>',
        secret: '<%= awsSettings.secretAccessKey %>',
        bucket: '<%= awsSettings.bucket %>',
        access: 'public-read',
        connections: 5
      },
      dist: {
        files: [{
          expand: true,
          cwd: 'dist/',
          src: '**/*.*',
          dest: './'
        }]
      }
    },

    exec: {
      transform: {
        cmd: 'xsltproc --stringparam outputpath dist/ xslt/site.xslt xml/site.xml'
      },
      clean: {
        cmd: 'find dist -mindepth 1 -and \\( \\( -name "assets" \\) -prune -or -prune -exec rm -rfv "\{\}" \\; \\)'
      }
    }
  });

  // Default task.
  grunt.registerTask('default', ['exec:clean', 'exec:transform', 'compass']);

  // Build
  grunt.registerTask('build', ['exec:clean', 'exec:transform']);

  // Deploy
  grunt.registerTask('deploy', ['s3deploy:dist']);

};
