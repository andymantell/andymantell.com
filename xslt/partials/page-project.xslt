<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:template match="project">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="concat('projects/', @slug)" />
      <xsl:with-param name="title" select="@title" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="project" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <xsl:template match="project" mode="body">
    <p>This is the <xsl:value-of select="@title" /> project</p>
  </xsl:template>
</xsl:stylesheet>
