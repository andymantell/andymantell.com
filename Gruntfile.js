// Grunt.js config
module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-exec');

  // Project configuration.
  grunt.initConfig({
    twitter: grunt.file.readJSON('twitter.json'),
    lastfm: grunt.file.readJSON('lastfm.json'),

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

  // Fetch recent tweets
  grunt.registerTask('get_tweets', 'Get tweets', function () {
    var util = require('util'),
    twitter = require('twitter-1.1');

    var jsontoxml = require("jsontoxml");

    var done = this.async();

    var twit = new twitter(grunt.config.data.twitter);

    twit.get('/statuses/user_timeline.json', {screen_name: "andymantell", count: 3}, function(data) {

      var recent_tweets = {
        recent_tweets: []
      };

      data.forEach(function(item) {
        recent_tweets.recent_tweets.push({tweet: item});
      });

      var fs = require('fs');
      fs.writeFile("xml/recent_tweets.xml", jsontoxml(recent_tweets, {prettyPrint: true, xmlHeader: true, removeIllegalNameCharacters : true}), function(err) {
        if(err) {
            console.log(err);
        } else {
            console.log("Saved tweet xml.");
        }

        done();
      });
    });
  });

  // Fetch recent tracks
  grunt.registerTask('get_recent_tracks', 'Get recent tracks', function () {
    var util = require('util');
    var http = require('http')
    var request = require("request");

    var done = this.async();

    request('http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=andymantell&api_key=' + grunt.config.data.lastfm.api_key, function(error, response, body) {
      var fs = require('fs');
      fs.writeFile("xml/recent_tracks.xml", body, function(err) {
        if(err) {
            console.log(err);
        } else {
            console.log("Saved recent tracks xml.");
        }

        done();
      });
    });
  });

  // Default task.
  grunt.registerTask('default', ['exec:clean', 'exec:transform', 'compass']);

  // Build
  grunt.registerTask('build', ['get_tweets', 'get_recent_tracks', 'exec:clean', 'exec:transform', 'exec:logpaths']);

};
