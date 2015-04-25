var moment = require('moment');

module.exports = {
  options: {
    accessKeyId: '<%= aws.accessKeyId %>',
    secretAccessKey: '<%= aws.secretAccessKey %>',
    region: '<%= aws.region %>',
    uploadConcurrency: 5,
    downloadConcurrency: 5,
    // differential: true,
    displayChangesOnly: true,
    progress: 'progressBar',
    gzipRename: 'ext',
    params: {
      CacheControl: 'public',
      Expires: moment().add(1, 'year').toDate()
    }
  },
  push_production_assets: {
    options: {
      bucket: '<%= aws.bucket %>'
    },
    files: [
      {
        expand: true,
        cwd: 'dist/',
        src: [
          '**',
          '!**/*.html.gz', // Exclude html stuff
          '!**/*.html', // Exclude non gzipped stuff
          '!**/*.css',
          '!**/*.js',
        ]
      }
    ]
  },
  push_production_html: {
    options: {
      bucket: '<%= aws.bucket %>',
      params: {
        Expires: moment().add(1, 'hour').toDate()
      }
    },
    files: [
      {
        expand: true,
        cwd: 'dist/',
        src: [
          '**/*.html.gz',
          '!**/*.html', // Exclude non gzipped stuff
        ]
      }
    ]
  },
  clean_production: {
    options: {
      bucket: '<%= aws.bucket %>',
      debug: false
    },
    files: [
      {dest: '/', action: 'delete'}
    ]
  }
};
