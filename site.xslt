<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:param name="outputpath" />

  <xsl:template match="page">
    <exsl:document href="{$outputpath}{@path}/index.html" method="xml" omit-xml-declaration="yes" indent="yes">
      <html>
        <body>
          <h1><xsl:value-of select="@title"/></h1>
          <xsl:copy-of select="region[name=content]"/>
        </body>
      </html>
    </exsl:document>
  </xsl:template>

</xsl:stylesheet>
