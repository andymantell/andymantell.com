<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Basic page templates -->
  <!-- ===================================================================== -->
  <xsl:template match="page[not(@listing)]">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="@path" />
    </xsl:call-template>

    <!-- Recursively match child pages in the structure -->
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="page[not(@listing)]" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <xsl:template match="page[not(@listing)]" mode="body">
    <p>This is the <xsl:value-of select="@title" /> page</p>
  </xsl:template>

</xsl:stylesheet>
