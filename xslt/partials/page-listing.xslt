<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:template match="page[@listing]">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="@path" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="page[@listing]" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <xsl:template match="page[@listing]" mode="body">
    <p><xsl:value-of select="@listing" /> listing to go here</p>
  </xsl:template>

</xsl:stylesheet>
