<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Images -->
  <!-- ===================================================================== -->
  <xsl:template match="image">
    <img src="{@src}" />
    <!--<img src="{$image/@src}" />-->
    <!--<xsl:copy-of select="$image" />-->
  </xsl:template>

</xsl:stylesheet>
