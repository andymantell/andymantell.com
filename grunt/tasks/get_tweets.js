module.exports = function(grunt) {
  // Fetch recent tweets
  grunt.registerTask('get_tweets', 'Get tweets', function () {
    var util = require('util'),
    twitter = require('twitter-1.1');

    var jsontoxml = require("jsontoxml");
    var twitter_text = require('twitter-text');

    var done = this.async();

    var twit = new twitter(grunt.config.data.twitter);

    twit.get('/statuses/user_timeline.json', { screen_name: "andymantell", count: 50, exclude_replies: true, include_rts: false, trim_user: true }, function(data) {

      var recent_tweets = {
        recent_tweets: []
      };

      data.forEach(function(item) {
        recent_tweets.recent_tweets.push({tweet: {
          text: twitter_text.autoLink(twitter_text.htmlEscape(item.text), {
            urlEntities: item.entities.urls
          })
        }});
      });

      var fs = require('fs');
      var xml = jsontoxml(recent_tweets, {
        escape: false,
        prettyPrint: true,
        xmlHeader: true,
        removeIllegalNameCharacters: true
      });

      fs.writeFile("xml/recent_tweets.xml", xml, function(err) {
        if(err) {
          console.log(err);
        } else {
          console.log("Saved tweet xml.");
        }

        done();
      });
    });
  });
};
