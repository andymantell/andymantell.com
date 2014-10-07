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

      <xsl:with-param name="sidebar-right">
        <xsl:copy-of select="region[@name='sidebar']" />

        <a class="button" href="/CV.pdf">View my CV</a>
        <a class="button" href="mailto:contact@andymantell.com">Get in touch</a>

        <h2><a href="/blog">Blog</a></h2>
        <xsl:call-template name="teaser-listing">
          <xsl:with-param name="items" select="/site/blogpost" />
          <xsl:with-param name="limit">3</xsl:with-param>
        </xsl:call-template>
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
    <xsl:copy-of select="region[@name='content']" />

    <xsl:call-template name="teaser-listing">
      <xsl:with-param name="items" select="/site/project" />
      <xsl:with-param name="limit">5</xsl:with-param>
      <xsl:with-param name="modifier">promo-gallery</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
