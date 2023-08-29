<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../sistory/html5-foundation6/to.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
  
   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- https://www2.sistory.si/publikacije/ -->
   <!-- ../../../  -->
   <xsl:param name="path-general">https://www2.sistory.si/publikacije/</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>
   <!--
   <xsl:param name="splitLevel">1</xsl:param>-->
   
   <xsl:param name="homeLabel">Domov</xsl:param>
   <xsl:param name="homeURL">https://sistory.github.io/</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>
   
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description">VSEBINE IN NJIHOVO RAZPOREJANJE NA
      PORTALU ZGODOVINA SLOVENIJE – SISTORY</xsl:param>
   <xsl:param name="keywords">Zgodovina Slovenije - portal SIstory, digitalni pristopi, digitalizacija</xsl:param>
   <xsl:param name="title">VSEBINE IN NJIHOVO RAZPOREJANJE NA
      PORTALU ZGODOVINA SLOVENIJE – SISTORY (s poudarkom na publikacijah)</xsl:param>
   
   <xsl:param name="numberBackHeadings"></xsl:param>
   <xsl:param name="numberFigures">false</xsl:param>
   <xsl:param name="numberFrontTables">false</xsl:param>
   <xsl:param name="numberHeadings">false</xsl:param>
   <xsl:param name="numberParagraphs">false</xsl:param>
   <xsl:param name="numberTables">false</xsl:param>
   <xsl:param name="postQuote"></xsl:param>
   <xsl:param name="preQuote"></xsl:param>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>izpis spremnih študij, glede na število back/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-study-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>O avtoricah</xsl:text>
   </xsl:template>
   
   <!--<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za glavno (body) vsebino</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-body-head">
      <xsl:param name="thisLanguage"></xsl:param>
      <xsl:text>Prispevki</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za front front/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-front-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Foreword</xsl:when>
         <xsl:otherwise>Predgovor</xsl:otherwise>
      </xsl:choose>
   </xsl:template>-->
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>izpis spremnih študij, glede na število back/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-summary-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Summary</xsl:text>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc> NASLOVNA STRAN </xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titlePage">
      <!-- avtor --><!--
      <p  class="naslovnicaAvtor">
         <xsl:for-each select="tei:docAuthor">
            <xsl:choose>
               <xsl:when test="tei:forename or tei:surname">
                  <xsl:for-each select="tei:forename">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="tei:surname">
                     <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:for-each select="tei:surname">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() ne last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <br/>-->
      <!-- naslov -->
      <xsl:for-each select="tei:docTitle/tei:titlePart[1]">
         <h1 class="text-center">
            <xsl:value-of select="."/>
         </h1>
         <xsl:for-each select="following-sibling::tei:titlePart">
            <h1 class="subheader podnaslov">
               <xsl:value-of select="."/>
            </h1>
         </xsl:for-each>
      </xsl:for-each>
      <xsl:if test="tei:graphic">
         <div class="text-center">
            <p>
               <img src="{tei:graphic/@url}" alt="naslovna slika" style="max-height: 500px;"/>
            </p>
         </div>
      </xsl:if>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Dodatno za kolofon: procesiranje idno</desc>
   </doc>
   <xsl:template match="tei:publicationStmt" mode="kolofon">
      <xsl:apply-templates select="tei:publisher" mode="kolofon"/>
      <xsl:apply-templates select="tei:date" mode="kolofon"/>
      <xsl:apply-templates select="tei:pubPlace" mode="kolofon"/>
      <xsl:apply-templates select="tei:availability" mode="kolofon"/>
      <xsl:apply-templates select="tei:idno" mode="kolofon"/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:idno" mode="kolofon">
      <p>
         <xsl:choose>
            <xsl:when test="matches(.,'https?://')">
               <a href="{.}">
                  <xsl:value-of select="."/>
               </a>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="concat(@type,' ',.)"/>
            </xsl:otherwise>
         </xsl:choose>
      </p>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>orgName v respStmt</desc>
   </doc>
   <xsl:template match="tei:respStmt" mode="kolofon">
      <xsl:apply-templates select="tei:resp" mode="kolofon"/>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:resp" mode="kolofon">
      <p>
         <em>
            <xsl:value-of select="concat(.,':')"/>
         </em>
         <br />
         <xsl:for-each select="following-sibling::tei:name">
            <span itemprop="contributor">
               <xsl:apply-templates/>
            </span>
            <br />
         </xsl:for-each>
         <xsl:for-each select="following-sibling::tei:orgName">
            <span itemprop="contributor">
               <xsl:apply-templates/>
            </span>
            <br />
         </xsl:for-each>
      </p>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>V css in javascript Hook dodam imageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="cssHook">
      <xsl:if test="$title-bar-sticky = 'true'">
         <xsl:value-of select="concat($path-general,'themes/css/foundation/6/sistory-sticky_title_bar.css')"/>
      </xsl:if>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/plugin/TipueSearch/6.1/tipuesearch/css/normalize.css')}" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/css/plugin/TipueSearch/6.1/my-tipuesearch.css')}"  rel="stylesheet" type="text/css" />
      <!-- dodan imageViewer -->
      <link href="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.css')}"  rel="stylesheet" type="text/css" />
      <!-- dodam projektno specifičen css, ki se nahaja v istem direktoriju kot ostali HTML dokumenti -->
      <link href="project.css" rel="stylesheet" type="text/css"/>        
      <!--      <script src="my-tipuesearch.css"></script>-->
   </xsl:template>
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>[html] Hook where extra Javascript functions can be defined</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="javascriptHook">
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/jquery.js')}"></script>
      <!-- za highcharts -->
      <xsl:if test="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']]">
         <xsl:variable name="jsfile" select="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']][1]/tei:graphic[@mimeType = 'application/javascript']/@url"/>
         <xsl:variable name="chart-jsfile" select="document($jsfile)/html/body/script[1]/@src"/>
         <script src="{$chart-jsfile[1]}"></script>
      </xsl:if>
      <!-- za back-to-top in highcharts je drugače potrebno dati jquery, vendar sedaj ne rabim dodajati jquery kodo,
         ker je že vsebovana zgoraj -->
      <!-- dodan imageViewer -->
      <script src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.js')}"></script>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend='imageviewer']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="height:600px;" src="{tei:graphic[contains(@url,'normal')]/@url}" data-high-res-src="{tei:graphic[1]/@url}" alt="{normalize-space(tei:head)}"/>
         <figcaption>
            <xsl:value-of select="normalize-space(tei:head)"/>
         </figcaption>
      </figure>
      <br/>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Posebno oblikovanje za slike z intervjuji
         https://foundation.zurb.com/sites/docs/media-object.html</desc>
   </doc>
   <xsl:template match="tei:figure[@rend = 'interview']">
      <div class="media-object" id="{@xml:id}">
         <div class="media-object-section">
            <div class="thumbnail">
               <img class="imageviewer" src="{tei:graphic[contains(@url,'thumb')]/@url}"
                  data-high-res-src="{tei:graphic[not(contains(@url,'thumb'))]/@url}"/>
            </div>
         </div>
         <div class="media-object-section">
            <xsl:apply-templates select="*[not(self::tei:graphic)]"/>
         </div>
      </div>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Dodam zaključni javascript za ImageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="bodyEndHook">
      <script type="text/javascript">
         $(function () {
         var viewer = ImageViewer();
         $('.imageviewer').click(function () {
         var imgSrc = this.src,
         highResolutionImage = $(this).data('high-res-src');
         viewer.show(imgSrc, highResolutionImage);
         });
         });</script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/what-input.js')}"/>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/foundation.min.js')}"/>
      <script src="{concat($path-general,'themes/foundation/6/js/app.js')}"/>
      <!-- back-to-top -->
      <script src="{concat($path-general,'themes/js/plugin/back-to-top/back-to-top.js')}"/>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc> Dodaten link v kolofonu takoj za naslovom </xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titleStmt" mode="kolofon">
      <!-- avtor -->
      <p>
         <xsl:for-each select="tei:author">
            <span itemprop="author">
               <xsl:choose>
                  <xsl:when test="tei:forename or tei:surname">
                     <xsl:for-each select="tei:forename">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() ne last()">
                           <xsl:text> </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                     <xsl:if test="tei:surname">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                     <xsl:for-each select="tei:surname">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() ne last()">
                           <xsl:text> </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="."/>
                  </xsl:otherwise>
               </xsl:choose>
            </span>
            <xsl:if test="position() != last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <!-- Naslov mora vedno biti, zato ne preverjam, če obstaja. -->
      <p itemprop="name">
         <xsl:for-each select="tei:title[1]">
            <b><xsl:value-of select="."/></b>
            <xsl:if test="following-sibling::tei:title">
               <xsl:text> : </xsl:text>
            </xsl:if>
            <xsl:for-each select="following-sibling::tei:title">
               <xsl:value-of select="."/>
               <xsl:if test="position() != last()">
                  <xsl:text>, </xsl:text>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each>
      </p>
      <xsl:apply-templates select="tei:respStmt" mode="kolofon"/>
      <br/>
      <xsl:if test="tei:funder">
         <xsl:for-each select="tei:funder">
            <p itemprop="funder">
               <xsl:value-of select="."/>               
            </p>
            <p>
               <img src="{tei:figure[1]/tei:graphic/@url}" alt="naslovna slika" style="max-height: 100px;" class="center"/>
            </p>
            <p>
               <img src="{tei:figure[2]/tei:graphic/@url}" alt="naslovna slika2" style="max-height: 100px;" class="center"/>
            </p>
         </xsl:for-each>
      </xsl:if>
      <br/>
   </xsl:template>
   
   
   
</xsl:stylesheet>
