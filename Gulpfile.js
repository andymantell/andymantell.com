var glob = require('glob')
var gulp = require('gulp')

var config = {
  'applicationPath': './app',     // Path on disk to the main application folder
  'sourcePath': './app/assets/src',         // Path where the assets are located
  'destinationPath': './app/assets/dist',         // Path where the built assets should be written
  'sassPath': 'scss/*.scss'  // Path to the sass within the sourcePath
}

var tasks = glob.sync('./gulp/tasks/**/*.js')
tasks.forEach(function (task) {
  require(task)(gulp, config)
})
