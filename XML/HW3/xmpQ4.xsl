<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:element name="results">
            <xsl:apply-templates select="//book/author[not(./last=following::book/author/last and ./first = following::book/author/first)]">
                <xsl:sort select="last"/>
                <xsl:sort select="first"/>
            </xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="author">
        <xsl:element name="result">
            <xsl:copy-of select="last"/>
            <xsl:copy-of select="first"/>
            
            <xsl:variable name="lastN" select="last"/>
            <xsl:variable name="firstN" select="first"/>
            
            <xsl:for-each select="//book">
                <xsl:apply-templates select=".">
                    <xsl:with-param name="lastName" select="$lastN"/>
                    <xsl:with-param name="firstName" select="$firstN"/>
                </xsl:apply-templates>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="book">
        <xsl:param name="lastName"/>
        <xsl:param name="firstName"/>
        
        <xsl:if test="$firstName = author/first and $lastName = author/last">
            <xsl:copy-of select="title"/>
        </xsl:if> 
    </xsl:template>
</xsl:stylesheet>