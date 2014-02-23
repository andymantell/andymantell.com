<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Homepage body content -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@path='']" mode="body">
    <div class="grid-wrap">
      <div class="grid-col grid-two-thirds">
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
      </div>

      <div class="grid-col grid-one-third">
        <p>Lorem Ipsum is simply dummy text</p>
        <p>Lorem Ipsum is simply dummy text</p>
        <p>Lorem Ipsum is simply dummy text</p>
        <p>Lorem Ipsum is simply dummy text</p>
      </div>
    </div>

    <!-- Homepage project teasers -->
    <xsl:variable name="sortedItems">
      <xsl:for-each select="/site/project">
        <xsl:sort select="@sticky" order="descending" />
        <xsl:sort select="@date" order="descending" />
        <xsl:if test="not(position() > 6)">
          <xsl:copy-of select="." />
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <ul class="list-page list-page--gallery">
      <xsl:for-each select="exsl:node-set($sortedItems)/*">
        <li class="list-page__item"><xsl:apply-templates select="." mode="teaser" /></li>
      </xsl:for-each>
    </ul>
  </xsl:template>

</xsl:stylesheet>
