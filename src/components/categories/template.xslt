<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- List of category links -->
  <!-- ===================================================================== -->
  <xsl:template match="categories" mode="links">
    <ul class="categories">
      <xsl:apply-templates select="*" mode="categories" />
    </ul>
  </xsl:template>

  <!-- Individual category list items -->
  <!-- ===================================================================== -->
  <xsl:template match="category" mode="categories">
    <xsl:variable name="category" select="$rootSiteNode/category[@name = current()/@name][@status = 'published']" />

    <li class="categories__item">
      <a class="categories__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>

        <xsl:apply-templates select="$category" mode="title" />
      </a>
    </li>
  </xsl:template>

  <!-- Category page url -->
  <!-- ===================================================================== -->
  <xsl:template match="category" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="concat('projects/categories/', @name)" />
    <xsl:text>/</xsl:text>
  </xsl:template>

  <!-- Category page title -->
  <!-- ===================================================================== -->
  <xsl:template match="category" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Client teasers as found on list pages -->
  <!-- ===================================================================== -->
  <xsl:template match="category" mode="teaser">
    <article class="teaser">
      <a class="teaser__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>

        <xsl:apply-templates select="." mode="title" />
      </a>
    </article>
  </xsl:template>

  <!-- Category page -->
  <!-- ===================================================================== -->
  <xsl:template match="category">
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

  <!-- Category page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="category" mode="body">
    <xsl:copy-of select="region[@name='content']" />

    <xsl:variable name="category" select="@name" />

    <!-- <xsl:copy-of select="/site/project[descendant::category[@name=$category]]" /> -->

    <xsl:call-template name="teaser-listing">
      <xsl:with-param name="items" select="/site/project[categories/category[@name=$category]]" />
      <xsl:with-param name="limit">6</xsl:with-param>
      <xsl:with-param name="modifier">gallery</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
