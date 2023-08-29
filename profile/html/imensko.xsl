<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei" version="2.0">

    <!-- za potrebe imenskega kazala iz seznamam oseb v div>p> naredim listPers>person @xml:id="PriimekIme">persName>...  -->
    <!--    s to pretvorbo pazi na primere, kjer je le priimek ali le ime, ker bo izbrisalo prvi dve črki imena.-->
    <xsl:output method="xml"/>

    <!--<xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>-->

    <!-- konkretna pozicija (če jo imam v skupnem xmlju)-->
    <xsl:template match="/">
            <listPerson>
                <xsl:apply-templates select="div/p"/>
            </listPerson>
        </xsl:template>
    
    
    <xsl:template match="p">
        <xsl:variable name="fullName" select="normalize-space(.)"/>
        <xsl:variable name="commaPos" select="string-length(substring-before($fullName, ','))"/>
        <xsl:variable name="surname" select="substring($fullName, 1, $commaPos)"/>
        <xsl:variable name="forename" select="substring($fullName, $commaPos + 3)"/>

        <person xml:id="pers-{$surname}{$forename}">
            <persName>
                <surname>
                    <xsl:value-of select="$surname"/>
                </surname>
                <forename>
                    <xsl:value-of select="$forename"/>
                </forename>
            </persName>
        </person>
    </xsl:template>


</xsl:stylesheet>
