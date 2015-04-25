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
    <xsl:param name="body" />
    <xsl:param name="sidebar-right" />

    <exsl:document href="{$outputpath}{$filepath}/index.html" method="html" omit-xml-declaration="yes" indent="yes">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;</xsl:text>
      <html>

        <head>
          <title><xsl:apply-templates select="." mode="title" /></title>
          <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'/>
          <link rel="stylesheet" href="/assets/css/style.css" />
        </head>

        <body>
          <header class="masthead" role="banner">
            <div class="inner-wrapper">
              <a class="masthead__logo" href="/">Andy Mantell</a>
            </div>

            <xsl:call-template name="main_menu">
              <xsl:with-param name="current_page" select="." />
            </xsl:call-template>
          </header>

          <main class="main">
            <div class="inner-wrapper">
              <h1><xsl:apply-templates select="." mode="title" /></h1>

              <xsl:choose>
                <xsl:when test="$sidebar-right">
                  <div class="grid-wrap">
                    <div class="grid-col grid-two-thirds">
                      <xsl:copy-of select="$body" />
                    </div>
                    <div class="grid-col grid-one-third">
                      <xsl:copy-of select="$sidebar-right" />
                    </div>
                  </div>
                </xsl:when>

                <xsl:otherwise>
                  <xsl:copy-of select="$body" />
                </xsl:otherwise>

              </xsl:choose>

            </div>
          </main>

          <footer class="footer">
            <div class="inner-wrapper">
              <xsl:call-template name="footer" />
            </div>
          </footer>

          <script src="/assets/js/main.js"></script>
        </body>

      </html>
    </exsl:document>
  </xsl:template>

</xsl:stylesheet>
