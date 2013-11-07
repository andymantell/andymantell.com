<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Project page -->
  <!-- ===================================================================== -->
  <xsl:template match="project">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="concat('projects/', @slug)" />
      <xsl:with-param name="title" select="@title" />
      <xsl:with-param name="body">
        <xsl:apply-templates select="." mode="body" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Project page title -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Project page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="body">
    <p>This is the <xsl:value-of select="@title" /> project</p>
  </xsl:template>

  <!-- Project teasers as found on list pages -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="teaser">
    <li>
      This is a teaser for the <xsl:value-of select="@title" /> project
    </li>
  </xsl:template>
</xsl:stylesheet>
