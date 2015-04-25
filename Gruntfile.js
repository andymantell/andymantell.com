var path = require('path');

module.exports = function(grunt) {
  'use strict';

  // Output timing metrics
  require('time-grunt')(grunt);

  require('load-grunt-config')(grunt, {
    configPath: path.join(process.cwd(), 'grunt/config'),
    init: true,
    jitGrunt: true,
    data: {
      aliases: grunt.file.readYAML('./grunt/aliases.yaml'),
      twitter: grunt.file.readJSON('twitter.json'),
      lastfm: grunt.file.readJSON('lastfm.json'),
      aws: grunt.file.readJSON('aws.json'),
    }
  });

  // Load custom grunt tasks
  grunt.loadTasks('grunt/tasks');

};
