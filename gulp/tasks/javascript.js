const path = require('path')
const spawn = require('child_process').spawn

module.exports = (gulp, config) => {
  gulp.task('jquery', () =>
    gulp
      .src(require.resolve('jquery/dist/jquery.min.js'))
      .pipe(gulp.dest(path.join(config.destinationPath, 'javascripts')))
  )

  gulp.task('js-vendor', () =>
    gulp
      .src(path.join(config.sourcePath, 'javascripts/vendor/*'))
      .pipe(gulp.dest(path.join(config.destinationPath, 'javascripts/vendor')))
  )

  gulp.task('js-standalone', () =>
    gulp
      .src(path.join(config.sourcePath, 'javascripts/standalone/*'))
      .pipe(gulp.dest(path.join(config.destinationPath, 'javascripts/standalone')))
  )

  gulp.task('js', () => {
    var webpackArgs

    if (process.argv.includes('watch')) {
      webpackArgs = ['--watch', '--info-verbosity', 'verbose']
    } else {
      // If we're not running in dev mode, make webpack be quiet
      webpackArgs = ['--display', 'errors-only']
    }

    const webpack = spawn('webpack', webpackArgs)

    webpack.stdout.on('data', data => {
      console.log(data.toString())
    })

    webpack.stderr.on('data', data => {
      console.log(data.toString())
    })

    return webpack
  })
}
