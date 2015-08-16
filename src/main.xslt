<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="components/core/html.xslt"/>

  <xsl:include href="components/image/template.xslt"/>
  <xsl:include href="components/listing/template.xslt"/>
  <xsl:include href="components/list-page/template.xslt"/>
  <xsl:include href="components/panel/template.xslt"/>
  <xsl:include href="components/categories/template.xslt"/>
  <xsl:include href="components/service/template.xslt"/>
  <xsl:include href="components/htaccess/template.xslt"/>

  <xsl:include href="components/forms/instances/contact-form/template.xslt"/>

  <xsl:include href="components/masthead/template.xslt"/>
  <xsl:include href="components/masthead/main-menu/template.xslt"/>
  <xsl:include href="components/footer/template.xslt"/>

  <xsl:include href="components/generic-page/template.xslt"/>
  <xsl:include href="components/project/template.xslt"/>
  <xsl:include href="components/client/template.xslt"/>
  <xsl:include href="components/blog-post/template.xslt"/>
  <xsl:include href="components/homepage/template.xslt"/>

  <!-- Panel variants -->
  <xsl:include href="components/panel-cta/template.xslt"/>
  <xsl:include href="components/panel-recent-blog-posts/template.xslt"/>
  <xsl:include href="components/panel-services/template.xslt"/>
  <xsl:include href="components/panel-recent-projects/template.xslt"/>

  <xsl:param name="outputpath" />

  <xsl:variable name="rootSiteNode" select="/site" />

  <xsl:template match="/site">
    <xsl:apply-templates select="." mode="htaccess" />
    <xsl:apply-templates />
  </xsl:template>

</xsl:stylesheet>
