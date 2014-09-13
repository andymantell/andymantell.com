<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="partials/utils.xslt"/>

  <xsl:include href="partials/htaccess.xslt"/>
  <xsl:include href="partials/html.xslt"/>
  <xsl:include href="partials/main-menu.xslt"/>
  <xsl:include href="partials/footer.xslt"/>
  <xsl:include href="partials/page-basic.xslt"/>
  <xsl:include href="partials/page-listing.xslt"/>
  <xsl:include href="partials/page-project.xslt"/>
  <xsl:include href="partials/page-client.xslt"/>
  <xsl:include href="partials/page-blogpost.xslt"/>
  <xsl:include href="partials/homepage.xslt"/>

  <xsl:param name="outputpath" />

  <xsl:template match="/site">
    <xsl:apply-templates select="." mode="htaccess" />
    <xsl:apply-templates />
  </xsl:template>

</xsl:stylesheet>
