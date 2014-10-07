<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Recent tweets template -->
  <!-- ===================================================================== -->
  <xsl:template name="recent_tweets">
    <ul class="plain-list">
      <xsl:apply-templates select="document('../../../xml/recent_tweets.xml')" />
    </ul>
  </xsl:template>

  <!-- Recent tweets: individual tweet -->
  <!-- ===================================================================== -->
  <xsl:template match="tweet">
    <li class="plain-list__item">
      <xsl:value-of select="text" disable-output-escaping="yes" />
    </li>
  </xsl:template>

  <!-- We only want 4 tweets, do nothing with the rest of them -->
  <!-- ===================================================================== -->
  <xsl:template match="tweet[position() > 4]" />

</xsl:stylesheet>
