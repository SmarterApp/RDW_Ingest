<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

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

  <!-- this rule converts IAT multiple-choice, multiple-select, and ESRB responses to the expected format ("A,C,D") -->
  <xsl:template match="Response[contains(text(),'choiceInteraction_')]/text()">
    <xsl:variable name="choices" select="replace(., '\s*&lt;(?!/?value)[^&gt;]+&gt;\s*', '', ';j')"/>
    <xsl:variable name="choiceCharacters" select="replace($choices, '&lt;[^&lt;]+-choice-(\w)&lt;[^&gt;]+&gt;', '$1,')"/>
    <xsl:value-of select="substring($choiceCharacters, 1, string-length($choiceCharacters)-1)"/>
  </xsl:template>

</xsl:stylesheet>

