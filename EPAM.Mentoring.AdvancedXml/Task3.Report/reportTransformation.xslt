﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                exclude-result-prefixes="msxsl"
                xmlns:lib="http://library.by/catalog">

  <xsl:output method="html" indent="yes"/>

  <xsl:param name="Date" select="''"/>

  <xsl:variable name="genres">
    <genre>Computer</genre>
    <genre>Fantasy</genre>
    <genre>Romance</genre>
    <genre>Horror</genre>
    <genre>Science Fiction</genre>
  </xsl:variable>

  <xsl:template match="/lib:catalog">
    <xsl:variable name="books" select="/lib:catalog/lib:book"/>
    <html>
      <body>
        <h1>
          Current stocks by genres
          <xsl:value-of select="$Date"/>
        </h1>

        <xsl:for-each select="msxsl:node-set($genres)/genre">
          <xsl:variable name="genre" select="."/>
          <table border="1" width="100%" style="margin-bottom:20px">
            <caption>
              <h4>
                <xsl:value-of select="$genre"/>
              </h4>
            </caption>

            <tr>
              <th>Author</th>
              <th>Title</th>
              <th>Publish Date</th>
              <th>Registration Date</th>
            </tr>

            <xsl:variable name="books-for-genre" select="$books[lib:genre = $genre]"/>
            <xsl:for-each select="$books-for-genre">
              <tr>
                <td>
                  <xsl:value-of select="lib:author"/>
                </td>
                <td>
                  <xsl:value-of select="lib:title"/>
                </td>
                <td>
                  <xsl:value-of select="lib:publish_date"/>
                </td>
                <td>
                  <xsl:value-of select="lib:registration_date"/>
                </td>
              </tr>
            </xsl:for-each>
            
            <tr>
              <td colspan="4">
                <xsl:value-of select="$genre"/>
                Total:
                <xsl:value-of select="count($books-for-genre)"/>
              </td>
            </tr>
          </table>
        </xsl:for-each>

        <div>
          <h4>
            Total: <xsl:value-of select="count($books)"/>
          </h4>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
