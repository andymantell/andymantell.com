var moment = require('moment');

module.exports = {
  options: {
    accessKeyId: '<%= aws.accessKeyId %>',
    secretAccessKey: '<%= aws.secretAccessKey %>',
    region: '<%= aws.region %>',
    bucket: '<%= aws.bucket %>',
    headers: {
      CacheControl: 'public',
      Expires: moment().add(1, 'year').toDate()
    }
  },
  assets: {
    files: [
      {
        expand: true,
        cwd: 'dist/',
        src: [
          'assets/**',
          'images/**',
          '!**/Thumbs.db'
        ]
      }
    ]
  },
  html: {
    options: {
      headers: {
        Expires: moment().add(1, 'day').toDate()
      }
    },
    files: [
      {
        expand: true,
        cwd: 'dist/',
        src: [
          '**',
          '!assets/**',
          '!images/**',
          '!**/Thumbs.db'
        ]
      }
    ]
  }
};
