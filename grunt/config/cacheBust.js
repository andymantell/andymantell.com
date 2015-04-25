module.exports = {
  options: {
    encoding: 'utf8',
    algorithm: 'md5',
    length: 16,
    deleteOriginals: true,
    separator: '-'
  },
  assets: {
    files: [
      {
        baseDir: 'dist/',
        src: 'dist/**/*.html'
      }
    ]
  }
};
