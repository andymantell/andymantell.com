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
    gzipRename: 'ext'
  },
  push_production: {
    options: {
      bucket: '<%= aws.bucket %>'
    },
    files: [
      {
        expand: true,
        cwd: 'dist/',
        src: [
          '**',
          '!**/*.html', // Exclude non gzipped stuff
          '!**/*.css',
          '!**/*.js',
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
