var path = require('path')

var browserSync = require('../utils/browsersync')

module.exports = function (gulp, config) {
  gulp.task('watch', function () {
    gulp.watch(path.join(config.sourcePath, 'scss/**/*.scss'), ['sass', 'sass-lint'])
    gulp.watch(path.join(config.sourcePath, 'js/**/*.js'), ['js', 'standardjs'])
    gulp.watch('gulp/**/*.js', ['standardjs'])

    browserSync.init({
      port: 3000,
      server: 'app',
      open: false,
      files: ['app/dist', 'app/index.html']
    })

    console.log('Watching...')
  })
}
