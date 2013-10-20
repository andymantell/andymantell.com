<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="partials/html.xslt"/>
  <xsl:include href="partials/footer.xslt"/>

  <xsl:param name="outputpath" />

  <xsl:template match="site">
    <site>
      <projects>
        <xsl:apply-templates select="document('../xml/projects/jisc.xml')"/>
        <xsl:apply-templates/>
      </projects>
    </site>
  </xsl:template>

  <xsl:template match="page">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="@path" />
      <xsl:with-param name="title" select="@title" />
      <xsl:with-param name="content" select="region[name=content]" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="project">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="concat('projects/', @slug)" />
      <xsl:with-param name="title" select="@title" />
      <xsl:with-param name="content" select="region[name=content]" />
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
