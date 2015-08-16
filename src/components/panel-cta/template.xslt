<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- CTA Panel -->
  <!-- ===================================================================== -->
  <xsl:template match="panel[@name='cta']">
    <xsl:call-template name="panel-cta" />
  </xsl:template>

  <xsl:template name="panel-cta">
    <xsl:call-template name="panel">
      <xsl:with-param name="content">
        <xsl:call-template name="cta-availability" />
      </xsl:with-param>
      <xsl:with-param name="actions">
        <action href="/cv" text="View my CV" />
        <action href="mailto:contact@andymantell.com" text="Get in touch" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- CTA Panel on CV page -->
  <!-- ===================================================================== -->
  <xsl:template match="panel[@name='cta-cv']">
    <xsl:call-template name="panel-cta-cv" />
  </xsl:template>

  <xsl:template name="panel-cta-cv">
    <xsl:call-template name="panel">
      <xsl:with-param name="content">
        <xsl:call-template name="cta-availability" />
      </xsl:with-param>
      <xsl:with-param name="actions">
        <action modifier="pdf" href="/CV.pdf" text="Download as PDF" />
        <action href="mailto:contact@andymantell.com" text="Get in touch" />
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="cta-availability">
    <p>Available for contracts January 2015 onwards</p>
  </xsl:template>

</xsl:stylesheet>
