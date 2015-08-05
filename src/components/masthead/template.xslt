<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:dyn="http://exslt.org/dynamic"
  extension-element-prefixes="exsl dyn"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Masthead -->
  <!-- ===================================================================== -->
  <xsl:template name="masthead">

    <header class="masthead" role="banner">
      <div class="inner-wrapper">
        <a class="masthead__logo" href="/">
          <img src="/assets/img/logo.svg" width="424" alt="Andy Mantell" />
        </a>
      </div>

      <xsl:call-template name="main_menu">
        <xsl:with-param name="current_page" select="." />
      </xsl:call-template>
    </header>

  </xsl:template>

</xsl:stylesheet>
