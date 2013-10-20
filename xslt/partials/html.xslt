<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:template name="html">
    <xsl:param name="filepath" />
    <xsl:param name="title" />
    <xsl:param name="content" />

    <exsl:document href="{$outputpath}{$filepath}/index.html" method="xml" doctype="" omit-xml-declaration="yes" indent="yes">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;</xsl:text>
      <html>
        <head>
          <title><xsl:value-of select="$title" /></title>
        </head>
        <body>
          <xsl:copy-of select="$content"/>
          <xsl:call-template name="footer" />
        </body>
      </html>
    </exsl:document>
  </xsl:template>

</xsl:stylesheet>
