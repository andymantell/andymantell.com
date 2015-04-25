module.exports = {
  transform: {
    cmd: 'xsltproc --stringparam outputpath dist/ src/main.xslt xml/site.xml'
  },
  remove_xml: {
    cmd: 'rm xml/site.xml'
  },
  clean: {
    cmd: 'find dist -mindepth 1 -and \\( \\( -name "assets" \\) -prune -or -prune -exec rm -rfv "\{\}" \\; \\)'
  },
  logpaths: {
    cmd: 'echo "Output structure:"; ls dist/* -R | grep ":$" | sed -e \'s/:$//\' -e \'s/[^-][^\\/]*\\//--/g\' -e \'s/^/   /\' -e \'s/-/|/\''
  }
};
