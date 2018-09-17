<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:trt="http://www.smarterbalanced.org/trt/transformation">
  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

  <!-- Helper function for "unescaping" wrapped XML content -->
  <xsl:function name="trt:unescape">
    <xsl:param name="escapedContent"/>
    <xsl:variable name="ltUnescaped" select="replace($escapedContent, '&amp;lt;', '&lt;')"/>
    <xsl:variable name="gtUnescaped" select="replace($ltUnescaped, '&amp;gt;', '&gt;')"/>
    <xsl:value-of select="replace($gtUnescaped, '&amp;amp;', '&amp;')"/>
  </xsl:function>

  <!-- identity rule copies everything by default -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- this rule removes leading 10 from item bank key -->
  <xsl:template match="Item[starts-with(@bankKey, '10')]/@bankKey">
    <xsl:attribute name="bankKey">
      <xsl:value-of select="substring(., 3)"/>
    </xsl:attribute>
  </xsl:template>

  <!-- this rule converts IAT multiple-choice and multiple-select responses to the expected format ("A,C,D") -->
  <xsl:template match="Response[contains(text(),'choiceInteraction_1') and not(contains(text(), 'choiceInteraction_2'))]/text()">
    <xsl:variable name="choices" select="replace(., '\s*&lt;(?!/?value)[^&gt;]+&gt;\s*', '', ';j')"/>
    <xsl:variable name="choiceCharacters" select="replace($choices, '&lt;[^&lt;]+-choice-(\w)&lt;[^&gt;]+&gt;', '$1,')"/>
    <xsl:value-of select="substring($choiceCharacters, 1, string-length($choiceCharacters)-1)"/>
  </xsl:template>

  <!--
    This rule converts EBSR multiple-choice and multiple-select responses to the expected format:
    <itemResponse>
      <response id="EBSR1">
        <value>A</value>
      </response>
      <response id="EBSR2">
        <value>C</value>
      </response>
    </itemResponse>
  -->
  <xsl:template match="Response[contains(text(),'choiceInteraction_1') and contains(text(), 'choiceInteraction_2')]/text()">
    <xsl:variable name="convertedResponses" select="replace(., 'choiceInteraction_(\d).RESPONSE', 'EBSR$1')"/>
    <xsl:value-of select="replace($convertedResponses, 'choiceInteraction_\d-choice-(\w)', '$1')"/>
  </xsl:template>

  <!--
    This rule converse Match Interaction (MI) responses to the expected format:
    <itemResponse>
      <response id=""RESPONSE"">
        <value>1 a</value>
        <value>2 b</value>
        <value>3 a</value>
        <value>4 b</value>
      </response>
    </itemResponse>
  -->
  <xsl:template match="Response[contains(text(),'matchInteraction_')]/text()">
    <xsl:variable name="convertedResponses" select="replace(., 'matchInteraction_\d.RESPONSE', 'RESPONSE')"/>
    <xsl:value-of select="replace($convertedResponses, 'matchInteraction_\d-(\d)\W*matchInteraction_\d-(\w)', '$1 $2')"/>
  </xsl:template>

  <!--
    This rule converse Table Interaction (TI) responses to the expected format:
    <responseSpec>
      <responseTable>
        <tr><th id=""col0"" /><th id=""col1"" /><th id=""col2"" /><th id=""col3"" /><th id=""col4"" /><th id=""col5"" /><th id=""col6"" /><th id=""col7"" /><th id=""col8"" /><th id=""col9"" /><th id=""col10"" /></tr>
        <tr><td /><td>B</td><td /><td /><td>A</td><td /><td /><td>C</td><td /><td /><td>D</td></tr>
      </responseTable>
    </responseSpec>
  -->
  <xsl:template match="Response[contains(text(),'tableInteraction_')]/text()">
    <xsl:variable name="escapedResponse" select="replace(., '.+&lt;value&gt;(.+)&lt;/value&gt;.+', '$1', 's')"/>
    <xsl:value-of select="trt:unescape($escapedResponse)"/>
  </xsl:template>


</xsl:stylesheet>

