<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Client page -->
  <!-- ===================================================================== -->
  <xsl:template match="client">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath">
        <xsl:apply-templates select="." mode="url" />
      </xsl:with-param>
      <xsl:with-param name="title" select="@title" />

      <xsl:with-param name="body">
        <xsl:apply-templates select="." mode="body" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Client page title -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Client page url -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="concat('projects/', @slug)" />
  </xsl:template>

  <!-- Client page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="body">
    <xsl:copy-of select="region[@name='content']" />

    <!-- Project teasers -->
    <xsl:variable name="sortedItems">
      <xsl:for-each select="/site/project[@client='cx-partners']">
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

  <!-- Client teasers as found on list pages -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="teaser">
    <article class="teaser teaser--image">
      <a class="teaser__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>

        <header class="teaser__header">
          <h2 class="teaser__heading"><xsl:value-of select="@title" /></h2>
        </header>

        <xsl:apply-templates select="logo/image" />
      </a>
    </article>
  </xsl:template>

  <!-- Client teasers as found on project pages -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="associated">
    <article class="teaser teaser--image">
      <a class="teaser__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>

        <header class="teaser__header">
          <h2 class="teaser__heading"><xsl:value-of select="@title" /></h2>
        </header>

        <xsl:apply-templates select="logo/image" />
      </a>

      <xsl:copy-of select="description" />
    </article>
  </xsl:template>
</xsl:stylesheet>
