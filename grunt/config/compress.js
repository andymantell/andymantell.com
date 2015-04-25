module.exports = {
  dist: {
    options: {
      mode: 'gzip'
    },
    files: [
      {
        expand: true,
        src: ['dist/**/*.js'],
        dest: './',
        ext: '.js.gz'
      },
      {
        expand: true,
        src: ['dist/**/*.html'],
        dest: './',
        ext: '.html.gz'
      },
      {
        expand: true,
        src: ['dist/**/*.css'],
        dest: './',
        ext: '.css.gz'
      }
    ]
  }
}
