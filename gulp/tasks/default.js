module.exports = (gulp, config) => {
  gulp.task('copy', gulp.parallel([
    'images'
  ]))

  gulp.task('build', gulp.parallel([
    'sass',
    'js'
  ]))

  gulp.task('default', gulp.parallel([
    'build'
  ]))
}
