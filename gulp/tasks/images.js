const path = require('path')
const imagemin = require('gulp-imagemin')

module.exports = (gulp, config) => {
  gulp.task('appImages', () =>
    gulp
      .src(path.join(config.sourcePath, 'images/**'))
      .pipe(imagemin())
      .pipe(gulp.dest(path.join(config.destinationPath, 'images/app')))
  )

  gulp.task('images', gulp.parallel(['appImages']))
}
