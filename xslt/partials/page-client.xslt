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
    <xsl:value-of select="concat('projects/clients/', @slug)" />
  </xsl:template>

  <!-- Client page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="body">
    <p>This is the <xsl:value-of select="@title" /> client</p>
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

        <xsl:apply-templates select="images/image[@teaser]" />
      </a>
    </article>
  </xsl:template>
</xsl:stylesheet>
