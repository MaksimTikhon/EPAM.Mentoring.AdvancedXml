<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                exclude-result-prefixes="msxsl"
                xmlns:lib="http://library.by/catalog">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/lib:catalog">
    <xsl:element name="feed">
      <xsl:element name="title">
        <xsl:text>New books</xsl:text>
      </xsl:element>
      <xsl:element name="link">
        <xsl:attribute name="rel">
          <xsl:text>self</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="href">
          <xsl:text>http://library.by/catalog/feed</xsl:text>
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="updated">
        <xsl:text>2016-07-27</xsl:text>
      </xsl:element>
      <xsl:element name="author">
        <xsl:text>Maksim Tsikhan</xsl:text>
      </xsl:element>
      <xsl:element name="id">
        <xsl:text>bk</xsl:text>
      </xsl:element>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="lib:book">
    <xsl:element name="entry">
      <xsl:element name="title">
        <xsl:value-of select="lib:title"></xsl:value-of>
      </xsl:element>
      <xsl:variable name="isbn" select="lib:isbn"/>
      <xsl:variable name="genre" select="lib:genre"/>
      <xsl:if test="$isbn != '' and $genre = 'Computer'">
        <xsl:element name="link">
          <xsl:attribute name="href">
            <xsl:value-of select="concat('http://my.safaribooksonline.com/', $isbn)"></xsl:value-of>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>
      <xsl:element name="updated">
        <xsl:value-of select="lib:registration_date"></xsl:value-of>
      </xsl:element>
      <xsl:element name="id">
        <xsl:value-of select="@id"></xsl:value-of>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
