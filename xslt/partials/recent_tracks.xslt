<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Recent tracks template -->
  <!-- ===================================================================== -->
  <xsl:template name="recent_tracks">
    <ul class="plain-list">
      <xsl:apply-templates select="document('../../xml/recent_tracks.xml')"/>
    </ul>
  </xsl:template>

  <!-- Recent tracks: individual track -->
  <!-- ===================================================================== -->
  <xsl:template match="lfm/recenttracks/track">
    <li class="plain-list__item">
      <a href="{url}">
        <xsl:value-of select="artist" />: <xsl:value-of select="name" />
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
