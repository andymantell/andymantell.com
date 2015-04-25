<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="../twitter-feed/template.xslt"/>
  <xsl:include href="../recent-tracks/template.xslt"/>

  <!-- Page footer -->
  <!-- ===================================================================== -->
  <xsl:template name="footer">
    <div class="grid-wrap">

      <div class="grid-col grid-one-third">
        <xsl:call-template name="recent_tweets" />
      </div>

      <div class="grid-col grid-one-third">
        <xsl:call-template name="recent_tracks" />
      </div>

      <div class="grid-col grid-one-third">
        <xsl:call-template name="contact_form" />
      </div>

    </div>
  </xsl:template>

</xsl:stylesheet>
