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

    <xsl:variable name="client" select="@client" />

    <xsl:call-template name="html">
      <xsl:with-param name="filepath">
        <xsl:apply-templates select="." mode="url" />
      </xsl:with-param>
      <xsl:with-param name="title" select="@title" />

      <xsl:with-param name="body">
        <xsl:apply-templates select="images/image" />
        <xsl:apply-templates select="." mode="body" />
      </xsl:with-param>

      <xsl:with-param name="sidebar-right">
        <xsl:apply-templates select="/site/client[@slug=$client]" mode="associated" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Project page title -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Project page url -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="concat('projects/', @client, '/', @slug)" />
  </xsl:template>

  <!-- Project page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="body">
    <xsl:copy-of select="region[@name='content']" />
  </xsl:template>

  <!-- Project teasers as found on list pages -->
  <!-- ===================================================================== -->
  <xsl:template match="project" mode="teaser">
    <article class="teaser teaser--image">
      <a class="teaser__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>

        <header class="teaser__header">
          <h2 class="teaser__heading"><xsl:value-of select="@title" /></h2>
        </header>

        <xsl:apply-templates select="images/image[@teaser]" />
      </a>
    </article>
  </xsl:template>
</xsl:stylesheet>
