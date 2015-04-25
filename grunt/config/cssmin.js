module.exports = {
  options: {
    mediaMerging : true
  },
  dist: {
    files: [{
      expand: true,
      cwd: 'dist/assets/css',
      src: ['*.css', '!*.min.css'],
      dest: 'dist/assets/css'
    }]
  }
};
