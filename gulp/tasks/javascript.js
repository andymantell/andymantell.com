var glob = require('glob')
var path = require('path')
var webpack = require('webpack')
var uglify = require('gulp-uglify')
var rename = require('gulp-rename')

module.exports = function (gulp, config) {
  gulp.task('js', function () {
    var promises = []

    // Loop over all our entrypoints
    var entrypoints = glob.sync(path.join(config.sourcePath, 'js/*.js'))

    if (!entrypoints) {
      return
    }

    entrypoints.forEach(function (entrypoint) {
      var name = path.basename(entrypoint)
      var outputFilename = path.relative(__dirname, path.join(config.destinationPath, 'js', name))

      promises.push(new Promise(function (resolve, reject) {
        webpack({
          entry: path.relative(__dirname, entrypoint),
          output: {
            filename: name,
            path: path.resolve(path.join(config.destinationPath, 'js'))
          },
          module: {
            loaders: [
              {
                test: /\.js$/,
                loader: 'babel-loader',
                query: {
                  presets: [
                    [
                      'env'
                    ]
                  ]
                }
              }
            ]
          }
        },
        function (err, stats) {
          if (err) {
            return reject(err)
          }
          resolve(outputFilename)
        })
      }))
    })

    // Uglify used directly rather than as part of webpack so that we can generate minified files as well as keeping the originals
    var minify = function (outputs) {
      return gulp.src(outputs)
        .pipe(uglify())
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(path.join(config.destinationPath, 'js')))
    }

    return Promise.all(promises).then(minify)
  })
}
