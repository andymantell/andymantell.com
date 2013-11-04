<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="partials/html.xslt"/>
  <xsl:include href="partials/main-menu.xslt"/>
  <xsl:include href="partials/footer.xslt"/>
  <xsl:include href="partials/page-basic.xslt"/>
  <xsl:include href="partials/page-listing.xslt"/>
  <xsl:include href="partials/page-project.xslt"/>
  <xsl:include href="partials/page-blogpost.xslt"/>

  <xsl:param name="outputpath" />

</xsl:stylesheet>
