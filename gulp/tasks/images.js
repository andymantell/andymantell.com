var path = require('path')

module.exports = function (gulp, config) {
  gulp.task('images', function () {
    return gulp
      .src(path.join(config.sourcePath, 'images/**'))
      .pipe(gulp.dest(path.join(config.destinationPath, 'images')))
  })
}
