<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- htaccess -->
  <!-- ===================================================================== -->
  <xsl:template match="site" mode="htaccess">
    <exsl:document href="{$outputpath}/.htaccess" omit-xml-declaration="yes" indent="no">
      <xsl:apply-templates select="//alias" mode="htaccess" />
    </exsl:document>
  </xsl:template>

  <!-- Redirects -->
  <!-- ===================================================================== -->
  <xsl:template match="alias" mode="htaccess">
    <xsl:text>Redirect 301 </xsl:text>
    <xsl:value-of select="." />
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="ancestor::*[@slug]" mode="url" />
    <xsl:text>&#xa;</xsl:text> <!-- Newline -->
  </xsl:template>

</xsl:stylesheet>
