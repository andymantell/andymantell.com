<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <xsl:include href="../blocks/recent_tweets.xslt"/>
  <xsl:include href="../blocks/recent_tracks.xslt"/>

  <!-- Page footer -->
  <!-- ===================================================================== -->
  <xsl:template name="footer">
    <div class="grid-wrap">

      <div class="grid-col grid-one-third">
        <xsl:call-template name="recent_tweets" />
      </div>

      <div class="grid-col grid-one-third">
        <xsl:call-template name="recent_tracks" />
      </div>

      <div class="grid-col grid-one-third">
        <form method="POST" action="//forms.brace.io/contact@andymantell.com">

          <label for="email">Email address</label>
          <input required="required" type="email" id="email" name="_replyto" />

          <label for="message">Message</label>
          <textarea required="required" name="message" id="message"></textarea>

          <input type="submit" value="Send" />

        </form>
      </div>

    </div>
  </xsl:template>

</xsl:stylesheet>