<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:element name="bib">
            <xsl:apply-templates select="bib/book"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="book">
        <xsl:if test="((./publisher = 'Addison-Wesley') and (./@year &gt; 1991))">
            <xsl:copy>
                <xsl:copy-of select="@year"/>
                <xsl:copy-of select="title"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>