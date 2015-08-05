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
    <xsl:text>/</xsl:text>
  </xsl:template>

  <!-- Client page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="body">
    <xsl:copy-of select="region[@name='content']" />

    <xsl:variable name="client" select="@slug" />

    <xsl:call-template name="teaser-listing">
      <xsl:with-param name="items" select="/site/project[@client=$client]" />
      <xsl:with-param name="limit">6</xsl:with-param>
      <xsl:with-param name="modifier">gallery</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Client teasers as found on list pages -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="teaser">
    <article class="teaser teaser--image">
      <a class="teaser__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>

        <xsl:apply-templates select="logo/image" />
      </a>
    </article>
  </xsl:template>

  <!-- Client teasers as found on project pages -->
  <!-- ===================================================================== -->
  <xsl:template match="client" mode="associated">

    <xsl:call-template name="panel">
      <xsl:with-param name="title">Under contract with</xsl:with-param>
      <xsl:with-param name="class">client</xsl:with-param>
      <xsl:with-param name="content">
        <article class="teaser teaser--image">
          <a class="teaser__link">
            <xsl:attribute name="href">
              <xsl:apply-templates select="." mode="url" />
            </xsl:attribute>

            <xsl:apply-templates select="logo/image" />
          </a>
        </article>

      </xsl:with-param>
    </xsl:call-template>

  </xsl:template>
</xsl:stylesheet>
