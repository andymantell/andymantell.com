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
    <article class="teaser media">
      <div class="media__item">
        <xsl:apply-templates select="images/image[@teaser]" />
      </div>
      <div class="media__content">
        <h3><xsl:value-of select="@title" /></h3>
        <xsl:copy-of select="./description" />
      </div>
    </article>
  </xsl:template>

</xsl:stylesheet>
