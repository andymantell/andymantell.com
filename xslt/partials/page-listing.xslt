<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:dyn="http://exslt.org/dynamic"
  extension-element-prefixes="exsl dyn"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Listing page -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]">

    <xsl:variable name="nodeType" select="@listing" />

    <xsl:variable name="sortedItems">
      <xsl:for-each select="/site/*[local-name() = $nodeType]">
        <xsl:sort select="@sticky" order="descending" />
        <xsl:sort select="@date" order="descending" />
        <xsl:copy-of select="." />
      </xsl:for-each>
    </xsl:variable>

    <xsl:call-template name="pagination">
      <xsl:with-param name="items" select="exsl:node-set($sortedItems)/*" />
      <xsl:with-param name="page" select="." />
      <xsl:with-param name="page_number" select="1" />
      <xsl:with-param name="rpp" select="@rpp" />
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="pagination">
    <xsl:param name="items" />
    <xsl:param name="page" />
    <xsl:param name="page_number" />
    <xsl:param name="rpp" />

    <xsl:call-template name="paginate">
      <xsl:with-param name="items" select="$items" />
      <xsl:with-param name="page" select="$page" />
      <xsl:with-param name="page_number" select="$page_number" />
      <xsl:with-param name="rpp" select="$rpp" />
      <xsl:with-param name="total_items" select="count($items)" />
      <xsl:with-param name="total_pages" select="ceiling(count($items) div $rpp)" />
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="paginate">
    <xsl:param name="items" />
    <xsl:param name="page" />
    <xsl:param name="page_number" />
    <xsl:param name="rpp" />
    <xsl:param name="total_items" />
    <xsl:param name="total_pages" />

    <xsl:call-template name="html">

      <xsl:with-param name="filepath">
        <xsl:apply-templates select="$page" mode="url" />

        <xsl:if test="$page_number &gt; 1">
          <xsl:text>/</xsl:text>
          <xsl:value-of select="$page_number" />
        </xsl:if>
      </xsl:with-param>

      <xsl:with-param name="body">
        <xsl:apply-templates select="$page" mode="body">
          <xsl:with-param name="items" select="$items[position() &lt;= $rpp]" />
          <xsl:with-param name="page_number" select="$page_number" />
          <xsl:with-param name="total_items" select="$total_items" />
          <xsl:with-param name="total_pages" select="$total_pages" />
        </xsl:apply-templates>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:variable name="remaining_items" select="$items[position() &gt; $rpp]" />

    <xsl:if test="$remaining_items">
      <xsl:call-template name="paginate">
        <xsl:with-param name="items" select="$remaining_items" />
        <xsl:with-param name="page" select="$page" />
        <xsl:with-param name="page_number" select="$page_number + 1" />
        <xsl:with-param name="rpp" select="@rpp" />
        <xsl:with-param name="total_items" select="$total_items" />
        <xsl:with-param name="total_pages" select="$total_pages" />
      </xsl:call-template>
    </xsl:if>

  </xsl:template>

  <xsl:template name="pager">
    <xsl:param name="page" />
    <xsl:param name="page_number" />
    <xsl:param name="total_items" />
    <xsl:param name="total_pages" />

    <li>
      <xsl:choose>
        <xsl:when test="$page = $page_number">
          <strong>
            <xsl:value-of select="$page" />
          </strong>
        </xsl:when>

        <xsl:otherwise>
          <a>
            <xsl:attribute name="href">
              <xsl:apply-templates select="." mode="url" />

              <xsl:if test="$page &gt; 1">
                <xsl:text>/</xsl:text>
                <xsl:value-of select="$page" />
              </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="$page" />
          </a>
        </xsl:otherwise>
      </xsl:choose>
    </li>

    <xsl:if test="$page &lt; $total_pages">
      <xsl:call-template name="pager">
        <xsl:with-param name="page" select="$page + 1" />
        <xsl:with-param name="page_number" select="$page_number" />
        <xsl:with-param name="total_items" select="$total_items" />
        <xsl:with-param name="total_pages" select="$total_pages" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <!-- Listing page title -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="title">
    <xsl:value-of select="@title" />
  </xsl:template>

  <!-- Listing page url -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="url">
    <xsl:text>/</xsl:text>
    <xsl:value-of select="@path" />
  </xsl:template>

  <!-- Listing page body content -->
  <!-- ===================================================================== -->
  <xsl:template match="page[@listing]" mode="body">
    <xsl:param name="items" />
    <xsl:param name="page_number" />
    <xsl:param name="total_items" />
    <xsl:param name="total_pages" />

    <ul>
      <xsl:apply-templates select="$items" mode="teaser" />
    </ul>

    <ul>
      <xsl:call-template name="pager">
        <xsl:with-param name="rooturl">
          <xsl:apply-templates select="." mode="url" />
        </xsl:with-param>
        <xsl:with-param name="page" select="1" />
        <xsl:with-param name="page_number" select="$page_number" />
        <xsl:with-param name="total_items" select="$total_items" />
        <xsl:with-param name="total_pages" select="$total_pages" />
      </xsl:call-template>
    </ul>
  </xsl:template>

</xsl:stylesheet>
