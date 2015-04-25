module.exports = {
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
};
