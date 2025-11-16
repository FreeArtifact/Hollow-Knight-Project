<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    
    <xsl:template match="character">
        <xsl:for-each select=".">
        <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates select="entry">
                    <xsl:sort select="@*"/>
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="entry">
        <xsl:copy>
        <xsl:choose>
            <xsl:when test="parent::character/@name ! replace(., '_', '') ! upper-case(.) = @info ! substring-before(., '_')">
                <xsl:attribute name="condition" select="@info"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="@*"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>