<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Homepage templates -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath">
        <xsl:apply-templates select="." mode="url" />
      </xsl:with-param>

      <xsl:with-param name="top">
        <div class="intro">
          <xsl:apply-templates select="region[@name='top']" />
        </div>
      </xsl:with-param>

      <xsl:with-param name="body">
        <xsl:apply-templates select="." mode="body" />
      </xsl:with-param>

      <xsl:with-param name="sidebar-right">
        <xsl:apply-templates select="region[@name='sidebar-right']" />
      </xsl:with-param>

      <xsl:with-param name="bottom">
        <xsl:apply-templates select="region[@name='bottom']" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Homepage title -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Homepage url -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="@path" />
    <xsl:text>/</xsl:text>
  </xsl:template>

  <!-- Homepage body content -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage" mode="body">
    <xsl:apply-templates select="region[@name='content']/*" />
  </xsl:template>

  <!-- Homepage bottom content -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage" mode="bottom">
    <xsl:apply-templates select="region[@name='bottom']/*" />
  </xsl:template>

  <!-- Homepage top content -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage" mode="top">
    <xsl:apply-templates select="region[@name='top']/*" />
  </xsl:template>

</xsl:stylesheet>
