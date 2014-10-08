<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="partials/utilities/image.xslt"/>
  <xsl:include href="partials/utilities/listing.xslt"/>
  <xsl:include href="partials/utilities/listpage.xslt"/>
  <xsl:include href="partials/utilities/categories.xslt"/>
  <xsl:include href="partials/utilities/htaccess.xslt"/>

  <xsl:include href="partials/forms/contact-form.xslt"/>

  <xsl:include href="partials/global/html.xslt"/>
  <xsl:include href="partials/global/main-menu.xslt"/>
  <xsl:include href="partials/global/footer.xslt"/>

  <xsl:include href="partials/content-types/page.xslt"/>
  <xsl:include href="partials/content-types/project.xslt"/>
  <xsl:include href="partials/content-types/client.xslt"/>
  <xsl:include href="partials/content-types/blogpost.xslt"/>
  <xsl:include href="partials/content-types/homepage.xslt"/>

  <xsl:param name="outputpath" />

  <xsl:variable name="rootSiteNode" select="/site" />

  <xsl:template match="/site">
    <xsl:apply-templates select="." mode="htaccess" />
    <xsl:apply-templates />
  </xsl:template>

</xsl:stylesheet>
