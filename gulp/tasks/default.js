module.exports = function (gulp, config) {
  gulp.task('copy', [
    'images'
  ])

  gulp.task('build', [
    'sass',
    'js'
  ])

  gulp.task('default', [
    'build'
  ])
}
