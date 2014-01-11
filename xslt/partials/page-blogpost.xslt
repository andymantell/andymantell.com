<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Blog post -->
  <!-- ===================================================================== -->
  <xsl:template match="blogpost">
    <xsl:call-template name="html">
      <xsl:with-param name="filepath">
        <xsl:apply-templates select="." mode="url" />
      </xsl:with-param>
      <xsl:with-param name="body">
        <xsl:apply-templates select="." mode="body" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Blog post title -->
  <!-- ===================================================================== -->
  <xsl:template match="blogpost" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Blog post url -->
  <!-- ===================================================================== -->
  <xsl:template match="blogpost" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="concat('blog/', @slug)" />
  </xsl:template>

  <!-- Blog post body content -->
  <!-- ===================================================================== -->
  <xsl:template match="blogpost" mode="body">
    <p>This is the <xsl:value-of select="@title" /> blogpost</p>
  </xsl:template>

  <!-- Blog post teasers as found on list pages -->
  <!-- ===================================================================== -->
  <xsl:template match="blogpost" mode="teaser">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="url" />
        </xsl:attribute>
        This is a teaser for the <xsl:value-of select="@title" /> blog post
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>
