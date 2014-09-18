<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- List of category links -->
  <!-- ===================================================================== -->
  <xsl:template match="categories" mode="links">
    <ul class="categories">
      <xsl:apply-templates select="*" mode="categories" />
    </ul>
  </xsl:template>

  <!-- Individual category list items -->
  <!-- ===================================================================== -->
  <xsl:template match="*" mode="categories">

    <li class="categories__item">
      <a href="#">
        <xsl:value-of select="$rootSiteNode/category[@name = current()/@name]/@title" />
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
