<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:variable name="increment" select="'    '"/>
    <xsl:variable name="newline" select="'&#xA;'"/>
    
    <xsl:template match="/">
        <xsl:element name="result">
            <xsl:apply-templates select="book/section"/>
            <xsl:value-of select="$newline"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="section">
        <xsl:param name="sectionindent" select="'    '"/>
        <xsl:param name="titleindent" select="concat($sectionindent, $increment)"/>
        
        <xsl:value-of select="$newline"/>
        <xsl:value-of select="$sectionindent"/>
        
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            
            <xsl:value-of select="$newline"/>
            <xsl:value-of select="$titleindent"/>
            
            <xsl:element name="title">
                <xsl:call-template name="title"/>
            </xsl:element>
            
            <xsl:apply-templates select="section">
                <xsl:with-param name="sectionindent" select="concat($sectionindent, $increment)"/>
            </xsl:apply-templates>
            
            <xsl:value-of select="$newline"/>
            <xsl:value-of select="$sectionindent"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="title">
        <xsl:value-of select="./title"/>
    </xsl:template>
</xsl:stylesheet>