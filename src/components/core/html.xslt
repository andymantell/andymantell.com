<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Main html template -->
  <!-- ===================================================================== -->
  <xsl:template name="html">
    <xsl:param name="filepath" />
    <xsl:param name="top" />
    <xsl:param name="body" />
    <xsl:param name="sidebar-right" />
    <xsl:param name="bottom" />

    <exsl:document href="{$outputpath}{$filepath}/index.html" method="html" omit-xml-declaration="yes" indent="yes">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;</xsl:text>
      <html>

        <head>
          <title><xsl:apply-templates select="." mode="title" /></title>
          <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'/>
          <link rel="stylesheet" href="/assets/css/main.css" />
        </head>

        <body>
          <xsl:call-template name="masthead" />

          <main class="main">
            <div class="inner-wrapper">
              <h1><xsl:apply-templates select="." mode="title" /></h1>

              <section class="spacing-bottom--single">
                <xsl:copy-of select="$top" />
              </section>

              <xsl:choose>
                <xsl:when test="$sidebar-right">
                  <div class="tablet-grid-wrap desktop-grid-wrap">
                    <div class="tablet-grid-col tablet-grid-two-fifths tablet-grid-push-three-fifths desktop-grid-col desktop-grid-one-third desktop-grid-push-two-thirds">
                      <xsl:copy-of select="$sidebar-right" />
                    </div>
                    <div class="tablet-grid-col tablet-grid-three-fifths tablet-grid-pull-two-fifths desktop-grid-col desktop-grid-two-thirds desktop-grid-pull-one-third">
                      <xsl:copy-of select="$body" />
                    </div>

                  </div>
                </xsl:when>

                <xsl:otherwise>
                  <xsl:copy-of select="$body" />
                </xsl:otherwise>

              </xsl:choose>

              <xsl:copy-of select="$bottom" />
            </div>
          </main>

          <xsl:call-template name="footer" />

          <script src="/assets/js/main.js"></script>
        </body>

      </html>
    </exsl:document>
  </xsl:template>

</xsl:stylesheet>
