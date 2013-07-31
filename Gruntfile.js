// Grunt.js config
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-exec');
  grunt.loadNpmTasks('grunt-aws');

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

    aws: {
      options: {
        config: {
          accessKeyId: '<%= awsSettings.accessKeyId %>',
          secretAccessKey: '<%= awsSettings.secretAccessKey %>',
        }
      },
      deploy: {
        service: 's3',
        options: {
          bucket: '<%= awsSettings.bucket %>',
          access: 'public-read',
          root: '/',
          endpoint: 's3-eu-west-1.amazonaws.com'
        },
        del: ['**/*.*'],
        put: ['dist/**/*.*']
      }
    },

    exec: {
      transform: {
        cmd: 'xsltproc --stringparam outputpath dist/ xslt/site.xslt xml/site.xml'
      },
      clean: {
        cmd: 'find dist -mindepth 1 -and \\( \\( -name "assets" \\) -prune -or -prune -exec rm -rfv "\{\}" \\; \\)'
      },
      logpaths: {
        cmd: 'echo "Output structure:"; ls dist/* -R | grep ":$" | sed -e \'s/:$//\' -e \'s/[^-][^\\/]*\\//--/g\' -e \'s/^/   /\' -e \'s/-/|/\''
      }
    }
  });

  // Default task.
  grunt.registerTask('default', ['exec:clean', 'exec:transform', 'compass']);

  // Build
  grunt.registerTask('build', ['exec:clean', 'exec:transform', 'exec:logpaths']);

  // Deploy
  grunt.registerTask('deploy', ['aws:deploy']);

};
