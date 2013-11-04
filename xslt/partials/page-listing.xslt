<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:dyn="http://exslt.org/dynamic"
  extension-element-prefixes="exsl dyn"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Listing page -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath" select="@path" />
    </xsl:call-template>
  </xsl:template>

  <!-- Listing page title -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Listing page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="body">
    <ul>
      <xsl:apply-templates select="dyn:evaluate(concat('/site/', @listing))" mode="teaser" />
    </ul>
  </xsl:template>
</xsl:stylesheet>
