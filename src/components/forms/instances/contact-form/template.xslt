<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="exsl"
  version="1.0">

  <!-- Contact form template -->
  <!-- ===================================================================== -->
  <xsl:template name="contact_form">
    <form class="form form--contact" method="POST" action="//forms.brace.io/contact@andymantell.com" novalidate="novalidate">

      <label for="email">Email address</label>
      <input required="required" type="email" id="email" name="_replyto" />

      <label for="message">Message</label>
      <textarea required="required" name="message" id="message"></textarea>

      <input type="submit" value="Send" />

    </form>
  </xsl:template>


</xsl:stylesheet>


