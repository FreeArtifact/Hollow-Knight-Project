<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <output method="xhtml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>The Inhabitants of Hollownest</title>
            </head>
            <body>
                <h1>The Inhabitants of Hollownest</h1>
                <ul>
                    <xsl:apply-templates select="descendant::character/attribute::name"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="attribute::name">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
</xsl:stylesheet>