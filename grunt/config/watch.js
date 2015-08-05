module.exports = {
  options: {
    atBegin: true
  },
  scss: {
    files: 'src/**/*.scss',
    tasks: ['css']
  },

  javascript: {
    files: 'src/**/*.js',
    tasks: ['js:dev']
  },

  build: {
    files: [
      'xml/**/*.*',
      '!xml/site.xml',
      'src/**/*.xslt'
    ],
    tasks: ['transform']
  },

  images: {
    'files': 'images/**',
    'tasks': ['images']
  }
};
