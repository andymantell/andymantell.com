<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:template name="html">
    <xsl:param name="filepath" />

    <exsl:document href="{$outputpath}{$filepath}/index.html" method="html" omit-xml-declaration="yes" indent="yes">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;</xsl:text>
      <html>

        <head>
          <title><xsl:apply-templates select="." mode="title" /></title>
        </head>

        <body>
          <header role="banner">
            <xsl:call-template name="main_menu">
              <xsl:with-param name="current_page" select="." />
            </xsl:call-template>
          </header>

          <main>
            <h1><xsl:apply-templates select="." mode="title" /></h1>
            <xsl:apply-templates select="." mode="body" />
          </main>

          <footer>
            <xsl:call-template name="footer" />
          </footer>
        </body>

      </html>
    </exsl:document>
  </xsl:template>

</xsl:stylesheet>
