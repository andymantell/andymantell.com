<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Services Panel -->
  <!-- ===================================================================== -->
  <xsl:template match="panel[@name='services']">
    <xsl:call-template name="panel-services" />
  </xsl:template>

  <xsl:template name="panel-services">
    <xsl:call-template name="panel">
      <xsl:with-param name="title">
        Services
      </xsl:with-param>
      <xsl:with-param name="content">
        <xsl:call-template name="teaser-listing">
          <xsl:with-param name="items" select="/site/service" />
          <xsl:with-param name="limit">6</xsl:with-param>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
