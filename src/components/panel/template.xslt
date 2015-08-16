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
    <xsl:param name="class" />
    <xsl:param name="actions"  />

    <section>
      <xsl:attribute name="class">
        <xsl:text>panel</xsl:text>
        <xsl:if test="$class">
          <xsl:text> panel--</xsl:text><xsl:value-of select="$class" />
        </xsl:if>
      </xsl:attribute>

      <xsl:if test="$title">
        <h2 class="panel__title">
          <xsl:copy-of select="$title" />
        </h2>
      </xsl:if>

      <div class="panel__content">
        <xsl:copy-of select="$content" />
      </div>

      <footer class="panel__actions">
        <xsl:for-each select="exsl:node-set($actions)/*">
          <a class="button">
            <xsl:attribute name="href">
              <xsl:value-of select="@href" />
            </xsl:attribute>
            <xsl:value-of select="@text" />
          </a>
        </xsl:for-each>
      </footer>
    </section>
  </xsl:template>

</xsl:stylesheet>
