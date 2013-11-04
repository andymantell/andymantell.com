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
    <xsl:apply-templates select="document('../../xml/recent_tweets.xml')"/>
  </xsl:template>

  <!-- Recent tweets: individual tweet -->
  <!-- ===================================================================== -->
  <xsl:template match="recent_tweets/tweet">
    <p><xsl:value-of select="text" /></p>
  </xsl:template>

</xsl:stylesheet>
