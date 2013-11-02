<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">


  <!-- Main menu -->
  <!-- ===================================================================== -->
  <xsl:template name="main_menu">
    <xsl:param name="current_page" />

    <nav class="main-menu">
      <xsl:call-template name="main_menu_items">
        <xsl:with-param name="pages" select="/site/page" />
        <xsl:with-param name="level" select="1" />
        <xsl:with-param name="current_page" select="$current_page" />
      </xsl:call-template>
    </nav>
  </xsl:template>

  <!-- Main menu items -->
  <!-- Based on a supplied set of pages, output a list of menu links -->
  <!-- ===================================================================== -->
  <xsl:template name="main_menu_items">
    <xsl:param name="pages" />
    <xsl:param name="level" />
    <xsl:param name="current_page" />

    <ul class="main-menu__level-{$level}">
      <xsl:apply-templates select="$pages" mode="main_menu_item">
        <xsl:with-param name="current_page" select="$current_page" />
        <xsl:with-param name="level" select="$level" />
      </xsl:apply-templates>
    </ul>
  </xsl:template>

  <!-- Individual menu item -->
  <!-- ===================================================================== -->
  <xsl:template match="page" mode="main_menu_item">
    <xsl:param name="current_page" />
    <xsl:param name="level" />

    <li>

      <!-- Setting the class -->
      <xsl:attribute name="class">

        <xsl:text>main-menu__level-</xsl:text><xsl:value-of select="$level" /><xsl:text>__item</xsl:text>

        <!-- Put an active trail class on the current item -->
        <xsl:if test="string-length(@path) > 1 and contains($current_page/@path, @path)">
          <xsl:text> main-menu__level-</xsl:text><xsl:value-of select="$level" /><xsl:text>__item--active-trail</xsl:text>
        </xsl:if>

        <!-- Put an active class on the current item -->
        <xsl:if test="$current_page/@path = @path">
          <xsl:text> main-menu__level-</xsl:text><xsl:value-of select="$level" /><xsl:text>__item--active</xsl:text>
        </xsl:if>

        <!-- If we've got visible child pages, then output a class indicating this -->
        <xsl:if test="page and contains($current_page/@path, @path)">
          <xsl:text> main-menu__level-</xsl:text><xsl:value-of select="$level" /><xsl:text>__item--has-children</xsl:text>
        </xsl:if>

      </xsl:attribute>

      <!-- Output the link -->
      <a href="/{@path}">
        <xsl:attribute name="class">
          <xsl:text>main-menu__level-</xsl:text><xsl:value-of select="$level" /><xsl:text>__link</xsl:text>
        </xsl:attribute>
        <xsl:value-of select="@title" />
      </a>

      <!-- If we've got child pages, then recursively output the menu items -->
      <xsl:if test="page and contains($current_page/@path, @path)">
        <xsl:call-template name="main_menu_items">
          <xsl:with-param name="level" select="$level + 1" />
          <xsl:with-param name="pages" select="page" />
          <xsl:with-param name="current_page" select="$current_page" />
        </xsl:call-template>
      </xsl:if>

    </li>
  </xsl:template>

</xsl:stylesheet>
