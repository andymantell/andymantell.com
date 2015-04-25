module.exports = {
  options: {
    accessKeyId: '<%= aws.accessKeyId %>',
    secretAccessKey: '<%= aws.secretAccessKey %>',
    region: '<%= aws.region %>',
    uploadConcurrency: 5,
    downloadConcurrency: 5
  },
  // production: {
  //   options: {
  //     bucket: '<%= aws.bucket %>'
  //   },
  //   files: [
  //     {expand: true, cwd: 'dist/', src: ['**']}
  //   ]
  // },
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
