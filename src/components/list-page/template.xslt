<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:dyn="http://exslt.org/dynamic"
  extension-element-prefixes="exsl dyn"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="../pagination/template.xslt"/>

  <!-- Listing page -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]">

    <xsl:variable name="nodeType" select="@listing" />

    <xsl:variable name="sortedItems">
      <xsl:for-each select="/site/*[local-name() = $nodeType][@status='published']">
        <xsl:sort select="@sticky" order="descending" />
        <xsl:sort select="@date" order="descending" />
        <xsl:copy-of select="." />
      </xsl:for-each>
    </xsl:variable>

    <xsl:call-template name="pagination">
      <xsl:with-param name="items" select="exsl:node-set($sortedItems)/*" />
      <xsl:with-param name="page" select="." />
      <xsl:with-param name="page_number" select="1" />
      <xsl:with-param name="rpp" select="@rpp" />
    </xsl:call-template>

    <!-- Recursively match child pages in the structure -->
    <xsl:apply-templates />

  </xsl:template>

  <!-- Listing page title -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Listing page url -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="@path" />
    <xsl:text>/</xsl:text>
  </xsl:template>

  <!-- Listing page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="body">
    <xsl:param name="items" />
    <xsl:param name="page_number" />
    <xsl:param name="total_items" />
    <xsl:param name="total_pages" />
    <xsl:param name="rpp" />

    <xsl:variable name="pager">
      <xsl:call-template name="pager">
        <xsl:with-param name="rooturl">
          <xsl:apply-templates select="." mode="url" />
        </xsl:with-param>
        <xsl:with-param name="page" select="1" />
        <xsl:with-param name="page_number" select="$page_number" />
        <xsl:with-param name="total_items" select="$total_items" />
        <xsl:with-param name="total_pages" select="$total_pages" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:copy-of select="$pager" />

    <xsl:call-template name="teaser-listing">
      <xsl:with-param name="items" select="$items" />
      <xsl:with-param name="limit" select="$rpp" />
      <xsl:with-param name="modifier" select="@listing-style" />
    </xsl:call-template>

    <xsl:copy-of select="$pager" />

  </xsl:template>

</xsl:stylesheet>
