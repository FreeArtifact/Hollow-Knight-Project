<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    
    <xsl:template match="entry">
        <!-- ebb: If an entry/@name does not contain the @type value,
        leave it alone. Don't transform it.
        
        If it does, transform @name into @condition, and remove the
        capitalized @type value from the start of it.
        -->
        <xsl:element name="{name()}">
            <!--preserves the name of the current element. -->
            <xsl:choose>
                <xsl:when test="@name ! tokenize(., '_') = parent::entries/@type ! upper-case(.)">
                      <xsl:variable name="matchString" select="parent::entries/@type ! upper-case(.)"/>
                    <xsl:attribute name="condition" select="@name ! substring-after(., $matchString || '_')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="info">
                        <xsl:value-of select="@name"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/>
        </xsl:element>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>