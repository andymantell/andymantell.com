<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="html.xslt"/>

  <xsl:include href="../image/template.xslt"/>
  <xsl:include href="../listing/template.xslt"/>
  <xsl:include href="../list-page/template.xslt"/>
  <xsl:include href="../categories/template.xslt"/>
  <xsl:include href="../htaccess/template.xslt"/>

  <xsl:include href="../forms/instances/contact-form/template.xslt"/>

  <xsl:include href="../masthead/main-menu/template.xslt"/>
  <xsl:include href="../footer/template.xslt"/>

  <xsl:include href="../generic-page/template.xslt"/>
  <xsl:include href="../project/template.xslt"/>
  <xsl:include href="../client/template.xslt"/>
  <xsl:include href="../blog-post/template.xslt"/>
  <xsl:include href="../homepage/template.xslt"/>

  <xsl:param name="outputpath" />

  <xsl:variable name="rootSiteNode" select="/site" />

  <xsl:template match="/site">
    <xsl:apply-templates select="." mode="htaccess" />
    <xsl:apply-templates />
  </xsl:template>

</xsl:stylesheet>
