module.exports = {
  options: {},
  files: {
    'dist/assets/js/main.js': ['assets/js/controllers/**/*.js'],
  },
  dev: {
    files: '<%= browserify.files %>',
    options: {}
  },
  prod: {
    files: '<%= browserify.files %>',
    options: {
      transform: [
        [
          'uglifyify',
          {
            global: true
          }
        ]
      ]
    }
  }
};
