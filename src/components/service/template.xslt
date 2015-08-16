<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">


  <!-- Service teasers -->
  <!-- ===================================================================== -->
  <xsl:template match="service" mode="teaser">
    <article class="teaser">
       <h3><xsl:value-of select="@title" /></h3>
       <xsl:copy-of select="./description" />
    </article>
  </xsl:template>

</xsl:stylesheet>
