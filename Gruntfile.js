// Grunt.js config
module.exports = function(grunt) {
  'use strict';

  require('load-grunt-tasks')(grunt);

  // Project configuration.
  grunt.initConfig({
    twitter: grunt.file.readJSON('twitter.json'),
    lastfm: grunt.file.readJSON('lastfm.json'),
    aws: grunt.file.readJSON('aws.json'),

    copy: {
      main: {
        files: [
          {
            expand: true,
            src: ['images/**'],
            dest: 'dist'},
        ]
      }
    },

    compass: {
      dist: {
        options: {
          config: 'config.rb'
        }
      }
    },

    watch: {
      scss: {
        files: 'assets/scss/**/*.scss',
        tasks: ['css']
      },

      javascript: {
        files: 'assets/js/**/*.js',
        tasks: ['js:dev']
      },

      images: {
        'files': 'images/**',
        'tasks': ['images']
      },

      build: {
        files: [
          'xml/**/*.*',
          '!xml/site.xml',
          'xslt/**/*.*'
        ],
        tasks: ['transform']
      }
    },

    concat: {
      xml: {
        options: {
          separator: '',
          process: function(src, filepath) {
            return src.replace(/<\?xml version="1.0"\?>\s*/g, '');
          },
          banner: '<?xml version="1.0"?>\n\n<site>',
          footer: '</site>'
        },
        src: [
          'xml/**/*.xml',
          '!xml/site.xml',
          '!xml/recent_tracks.xml',
          '!xml/recent_tweets.xml'
        ],
        dest: 'xml/site.xml',
      }
    },

    exec: {
      transform: {
        cmd: 'xsltproc --stringparam outputpath dist/ xslt/site.xslt xml/site.xml'
      },
      remove_xml: {
        cmd: 'rm xml/site.xml'
      },
      clean: {
        cmd: 'find dist -mindepth 1 -and \\( \\( -name "assets" \\) -prune -or -prune -exec rm -rfv "\{\}" \\; \\)'
      },
      logpaths: {
        cmd: 'echo "Output structure:"; ls dist/* -R | grep ":$" | sed -e \'s/:$//\' -e \'s/[^-][^\\/]*\\//--/g\' -e \'s/^/   /\' -e \'s/-/|/\''
      }
    },

    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      files: [
        'assets/**/*.js'
      ]
    },

    browserify: {
      options: {
        transform: [
          [
            'uglifyify',
            {
              global: true
            }
          ]
        ]
      },
      dev: {
        files: {
          'dist/assets/js/main.js': ['assets/js/main.js'],
        },
        options: {
          // browserifyOptions: {
          //   debug: true
          // },
        }
      },
      prod: {
        files: {
          'dist/assets/js/main.js': ['assets/js/main.js'],
        }
      }
    },

    htmlmin: {
      dist: {
        options: {
          removeComments: true,
          collapseWhitespace: true
        },
        files: [{
          expand: true,
          cwd: 'dist/',
          ext: '.html',
          src: ['**/*.html'],
          dest: 'dist/'
        }]
      },
    },

    aws_s3: {
      options: {
        accessKeyId: '<%= aws.accessKeyId %>',
        secretAccessKey: '<%= aws.secretAccessKey %>',
        region: '<%= aws.region %>',
        uploadConcurrency: 5,
        downloadConcurrency: 5
      },
      // production: {
      //   options: {
      //     bucket: '<%= aws.bucket %>'
      //   },
      //   files: [
      //     {expand: true, cwd: 'dist/', src: ['**']}
      //   ]
      // },
      clean_production: {
        options: {
          bucket: '<%= aws.bucket %>',
          debug: false
        },
        files: [
          {dest: '/', action: 'delete'}
        ]
      }
    },

    s3: {
      options: {
        accessKeyId: '<%= aws.accessKeyId %>',
        secretAccessKey: '<%= aws.secretAccessKey %>',
        region: '<%= aws.region %>',
        bucket: '<%= aws.bucket %>'
      },
      production: {
        files: [
          {
            expand: true,
            cwd: 'dist/',
            src: [
              '**',
              '!**/Thumbs.db'
            ]
          }
        ]
      }
    }
  });

  // Load custom grunt tasks
  grunt.loadTasks('grunt/tasks');

  // Default task.
  grunt.registerTask('default', ['rebuild']);

  // Fetch external data
  grunt.registerTask('fetch', ['get_tweets', 'get_recent_tracks']);

  // Transform
  grunt.registerTask('transform', ['exec:clean', 'copy', 'concat:xml', 'exec:transform', 'exec:remove_xml', 'exec:logpaths', 'htmlmin']);

  // Copy images
  grunt.registerTask('images', ['copy']);

  // Compile stylesheets
  grunt.registerTask('css', ['compass']);

  // Build JS
  grunt.registerTask('js', ['browserify:prod']);
  grunt.registerTask('js:dev', ['jshint', 'browserify:dev']);

  // Build
  grunt.registerTask('rebuild', ['fetch', 'transform', 'css', 'js']);

  // AWS tasks
  grunt.registerTask('clean_production', ['aws_s3:clean_production']);
  grunt.registerTask('push_production', ['s3:production']);
  grunt.registerTask('refresh_production', ['clean_production', 'push_production']);

  // Task to run on cron
  grunt.registerTask('cron', ['rebuild', 'push_production']);

};
