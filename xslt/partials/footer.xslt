<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="recent_tweets.xslt"/>
  <xsl:include href="recent_tracks.xslt"/>

  <xsl:template name="footer">
    <xsl:call-template name="recent_tweets" />
    <xsl:call-template name="recent_tracks" />
  </xsl:template>

</xsl:stylesheet>
