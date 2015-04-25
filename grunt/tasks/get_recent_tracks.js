module.exports = function(grunt) {
  // Fetch recent tracks
  grunt.registerTask('get_recent_tracks', 'Get recent tracks', function () {
    var util = require('util');
    var http = require('http')
    var request = require("request");

    var done = this.async();

    request('http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=andymantell&limit=5&api_key=' + grunt.config.data.lastfm.api_key, function(error, response, body) {
      var fs = require('fs');
      fs.writeFile("xml/recent-tracks.xml", body, function(err) {
        if(err) {
          console.log(err);
        } else {
          console.log("Saved recent tracks xml.");
        }

        done();
      });
    });
  });
};
