<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>


    <xsl:template match="/">
        <html>
            <head>
                <title>The Bugs</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" type="text/css" href="../css/style.css"/>
            </head>
            <body>
                <header>
                    <div class="navbar">
                        <a href="../index.html">Home</a>
                        <a href="bugTest.html">Bugs</a>
                        <a href="../research.html">Research</a>
                        <a href="../about.html">About</a>
                        <a href="../sources.html">Sources</a>
                    </div>
                </header>
                <main>
                <h1 class="bug-title">The Bugs of Hallownest</h1>
                <section class="content">
                    <ul class="character-list">
                        <xsl:apply-templates select="descendant::character"/>
                    </ul>
                </section>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="entry">
        <li>
            <h2><xsl:value-of select="@condition|@info"/>:</h2>
            <p><xsl:apply-templates/></p>
        </li>
    </xsl:template>
    
    <xsl:template match="character">
            <li class="{lower-case(@name)}-li">
                <a href="{@name}.html"><xsl:value-of select="replace(@name, '_', ' ')"/></a>
            </li>
        <xsl:result-document href="{@name}.html" method="html">
            <html>
                <head>
                    <title><xsl:value-of select="@name"/></title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
                </head>
                <body>
                    <header>
                        <div class="navbar">
                            <a href="../index.html">Home</a>
                            <a href="bugTest.html">Bugs</a>
                            <a href="../about#page-1.html">About</a>
                            <a href="../sources.html">Sources</a>
                        </div>
                    </header>
                    <main class="character-one-page">
                        <h1><xsl:value-of select="@name"/></h1>
                        <div class="character-one-content">
                            <ul>
                                <xsl:apply-templates select="descendant::entry"/>
                            </ul>
                        </div>
                    </main>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
