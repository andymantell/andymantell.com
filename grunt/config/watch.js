module.exports = {
  scss: {
    files: 'src/**/*.scss',
    tasks: ['css']
  },

  javascript: {
    files: 'src/**/*.js',
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
      'src/**/*.xslt'
    ],
    tasks: ['transform']
  }
};
