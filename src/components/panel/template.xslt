<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Panels -->
  <!-- ===================================================================== -->
  <xsl:template name="panel">
    <xsl:param name="title" />
    <xsl:param name="content" />

    <div class="panel">
      <xsl:if test="$title">
        <h2 class="panel__title">
          <xsl:copy-of select="$title" />
        </h2>
      </xsl:if>

      <div class="panel__content">
        <xsl:copy-of select="$content" />
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
