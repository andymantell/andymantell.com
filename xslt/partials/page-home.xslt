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

      <xsl:with-param name="body">
        <xsl:apply-templates select="." mode="body" />
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
  </xsl:template>

  <!-- Homepage body content -->
  <!-- ===================================================================== -->
  <xsl:template match="homepage" mode="body">
    <div class="grid-wrap">
      <div class="grid-col grid-two-thirds">
        <xsl:copy-of select="region[@name='content']" />
      </div>

      <div class="grid-col grid-one-third">
        <xsl:copy-of select="region[@name='sidebar']" />
      </div>
    </div>

    <!-- Homepage project teasers -->
    <xsl:variable name="sortedItems">
      <xsl:for-each select="/site/project">
        <xsl:sort select="@sticky" order="descending" />
        <xsl:sort select="@date" order="descending" />
        <xsl:if test="not(position() > 6)">
          <xsl:copy-of select="." />
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <ul class="list-page list-page--gallery">
      <xsl:for-each select="exsl:node-set($sortedItems)/*">
        <li class="list-page__item"><xsl:apply-templates select="." mode="teaser" /></li>
      </xsl:for-each>
    </ul>
  </xsl:template>

</xsl:stylesheet>
