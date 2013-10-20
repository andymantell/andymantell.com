<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:template name="recent_tracks">
    <xsl:apply-templates select="document('../../xml/recent_tracks.xml')"/>
  </xsl:template>

  <xsl:template match="lfm/recenttracks/track">
    <p>
      <xsl:value-of select="artist" />: <xsl:value-of select="name" />
    </p>
  </xsl:template>

</xsl:stylesheet>
