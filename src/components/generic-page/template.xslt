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
      <xsl:with-param name="filepath">
        <xsl:apply-templates select="." mode="url" />
      </xsl:with-param>
      <xsl:with-param name="body">
        <xsl:apply-templates select="." mode="body" />
      </xsl:with-param>
    </xsl:call-template>

    <!-- Recursively match child pages in the structure -->
    <xsl:apply-templates />
  </xsl:template>

  <!-- Basic page title -->
  <!-- ===================================================================== -->
  <xsl:template match="page[not(@listing)]" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Basic page url -->
  <!-- ===================================================================== -->
  <xsl:template match="page[not(@listing)]" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="@path" />
    <xsl:text>/</xsl:text>
  </xsl:template>

  <!-- Basic page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="page[not(@listing)]" mode="body">
    <xsl:copy-of select="region[@name='content']/*" />
  </xsl:template>

</xsl:stylesheet>
