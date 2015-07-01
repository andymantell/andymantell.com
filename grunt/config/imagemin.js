var mozjpeg = require('imagemin-mozjpeg');
var pngquant = require('imagemin-pngquant');
var gifsicle = require('imagemin-gifsicle');
var svgo = require('imagemin-svgo');

module.exports = {
  dist: {
    options: {
      optimizationLevel: 5,
      svgoPlugins: [{
        removeViewBox: false
      }],
      use: [
        mozjpeg(),
        svgo(),
        pngquant(),
        gifsicle()
      ]
    },
    files: [{
      expand: true,
      cwd: 'images/',
      src: ['**/*.{png,jpg,jpeg,gif,svg}'],
      dest: 'dist/images/'
    }]
  }
};
