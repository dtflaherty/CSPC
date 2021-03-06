<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="1.0">
    
    <xsl:output method="text" indent="yes" encoding="utf-8" standalone="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        point&#x9;title&#x9;description&#x9;icon
        <xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:settingDesc" />
    </xsl:template>
    
    <xsl:template match="tei:place">
        <xsl:value-of select="tei:location/tei:geo"/>
        <xsl:text>&#09;</xsl:text>
        <xsl:value-of select="tei:placeName"/>
        <xsl:text>&#09;</xsl:text>
        <xsl:value-of select="@type" />
        <xsl:text>&#09;</xsl:text>
        <xsl:choose>
            <xsl:when test="@type='region'">
                <xsl:text>/images/red_flag_icon.png</xsl:text>
            </xsl:when>
            <xsl:when test="@type='colony'">
                <xsl:text>/images/pink_flag_icon.png</xsl:text>
            </xsl:when>
            <xsl:when test="@type='place'">
                <xsl:text>/images/blue_flag_icon.png</xsl:text>
            </xsl:when>
            <xsl:when test="@type='natural'">
                <xsl:text>/images/green_flag_icon.png</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>