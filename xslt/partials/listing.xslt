<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Listing of teasers -->
  <!-- ===================================================================== -->
  <xsl:template name="teaser-listing">
    <xsl:param name="items" />
    <xsl:param name="limit" />
    <xsl:param name="modifier" />

    <xsl:variable name="sortedItems">
      <xsl:for-each select="exsl:node-set($items)[@status='published']">
        <xsl:sort select="@sticky" order="descending" />
        <xsl:sort select="@date" order="descending" />

        <xsl:if test="not(position() > $limit)">
          <xsl:copy-of select="." />
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <ul>
      <xsl:attribute name="class">
        <xsl:text>list-page</xsl:text>

        <xsl:if test="$modifier">
          <xsl:text> list-page--</xsl:text>
          <xsl:value-of select="$modifier" />
        </xsl:if>
      </xsl:attribute>
      <xsl:for-each select="exsl:node-set($sortedItems)/*">
        <li>
          <xsl:attribute name="class">
            <xsl:text>list-page__item</xsl:text>
          </xsl:attribute>

          <xsl:apply-templates select="." mode="teaser" />
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>

</xsl:stylesheet>
