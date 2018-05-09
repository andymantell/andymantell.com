var browserSync = require('../utils/browsersync')

module.exports = (gulp, config) => {
  const watchConfig = {
    cwd: config.sourcePath,
    usePolling: true
  }

  gulp.task('sassWatch', () => {
    const watcher = gulp.watch('scss/**/*.scss', watchConfig, gulp.series(['sass']))

    watcher.on('change', (path, stats) => {
      console.log(path + ' changed')
    })

    watcher.on('add', path => {
      console.log(path + ' added')
    })

    watcher.on('unlink', path => {
      console.log(path + ' removed')
    })
  })

  gulp.task('watch', gulp.parallel(['build', 'sassWatch', function() {
    browserSync.init({
      port: 3000,
      server: {
        baseDir: 'dist',
        index: '../src/index.html'
      },
      open: false,
      files: ['dist', 'src/index.html']
    })
  }]))
}
