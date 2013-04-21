<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xsl xi fn tei"
    version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml" omit-xml-declaration="yes" indent="yes"/>
    <xsl:variable name="allLocations" select="/" />
    
    <xsl:key name="location" match="tei:place" use="@xml:id" />
    
    <xsl:template match="/">
        <xsl:apply-templates select="tei:TEI/tei:text/tei:body" />
    </xsl:template>
    
    <xsl:template match="tei:body">
        <add>
        <xsl:apply-templates />
        </add>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <xsl:variable name="id" select="generate-id()"/>
        <doc>
            <field name="id"><xsl:value-of select="$id"/></field>
            <field name="citation_s"><xsl:value-of select="tei:dateline/tei:num"/></field>
            <field name="date_s"><xsl:value-of select="tei:dateline/tei:date/@when"/></field>
            <field name="formatedDate_s"><xsl:value-of select="tei:dateline/tei:date"/></field>
            
            <xsl:for-each select="tei:p/tei:placeName">
                <xsl:variable name="this">
                    <xsl:value-of select="substring-after(@ref, '#')"/>
                </xsl:variable>
                
                <xsl:variable name="latlon">
                    <xsl:value-of select="//tei:place[@xml:id = $this]/tei:location/tei:geo"/>
                </xsl:variable>
                
                <!-- todo: make _s multivalued -->
                <field name="placename_txt"><xsl:value-of select="node()"/></field>
                <field name="placeRole_txt"><xsl:value-of select="@role"/></field>
                
                <!-- todo: make _p multivalued 
                <field name="location_p"><xsl:value-of select="translate($latlon, ' ', ', ')"/></field>
                 <field name="wkt_s">POINT(<xsl:value-of select="$latlon"/>)</field>
                 -->
                <field name="location_txt"><xsl:value-of select="translate($latlon, ' ', ', ')"/></field>
                <field name="wkt_txt">POINT(<xsl:value-of select="$latlon"/>)</field>
                
            </xsl:for-each>

            <field name="text_t">&lt;![CDATA[<div id="{$id}"><xsl:apply-templates /></div>]]&gt;</field>
        </doc>
    </xsl:template>
    
    <xsl:template match="tei:dateline">
        
    </xsl:template>
 
    <xsl:template match="tei:p">
        <p><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="tei:placeName">
        <span class="placename" data-location=""><xsl:value-of select="node()"/></span>
    </xsl:template>
    
    
</xsl:stylesheet>