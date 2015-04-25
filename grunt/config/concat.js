module.exports = {
  xml: {
    options: {
      separator: '',
      process: function(src, filepath) {
        return src.replace(/<\?xml version="1.0".*\?>\s*/g, '');
      },
      banner: '<?xml version="1.0"?>\n\n<site>',
      footer: '</site>'
    },
    src: [
      'xml/**/*.xml',
      '!xml/site.xml',
      '!xml/recent-tracks.xml',
      '!xml/recent-tweets.xml'
    ],
    dest: 'xml/site.xml',
  }
};
