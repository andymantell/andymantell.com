<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="../twitter-feed/template.xslt"/>
  <xsl:include href="../recent-tracks/template.xslt"/>

  <!-- Page footer -->
  <!-- ===================================================================== -->
  <xsl:template name="footer">

    <footer class="footer">
      <div class="inner-wrapper">
        <div class="grid-wrap">

          <div class="grid-col grid-one-third">
            <xsl:call-template name="panel">
              <xsl:with-param name="title">
                <a href="https://twitter.com/andymantell">Recent tweets</a>
              </xsl:with-param>

              <xsl:with-param name="content">
                <xsl:call-template name="recent_tweets" />
              </xsl:with-param>
            </xsl:call-template>
          </div>

          <div class="grid-col grid-one-third">
            <xsl:call-template name="panel">
              <xsl:with-param name="title">
                <a href="https://last.fm/user/andymantell">Recent tracks</a>
              </xsl:with-param>

              <xsl:with-param name="content">
                <xsl:call-template name="recent_tracks" />
              </xsl:with-param>
            </xsl:call-template>
          </div>

          <div class="grid-col grid-one-third">
            <xsl:call-template name="panel">
              <xsl:with-param name="title">
                <a href="mailto:contact@andymantell.com">Get in touch</a>
              </xsl:with-param>

              <xsl:with-param name="content">
                <xsl:call-template name="contact_form" />
              </xsl:with-param>
            </xsl:call-template>
          </div>

        </div>
      </div>
    </footer>
  </xsl:template>

</xsl:stylesheet>
