<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="html" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>

    <xsl:variable name="index">
        <xsl:value-of select="concat('Fables-index', '.html')"/>
    </xsl:variable>

    <xsl:variable name="fable3">
        <xsl:value-of select="concat('Fables-3', '.html')"/>
    </xsl:variable>

    <xsl:variable name="fable4">
        <xsl:value-of select="concat('Fables-4', '.html')"/>
    </xsl:variable>

    <xsl:variable name="fable5">
        <xsl:value-of select="concat('Fables-5', '.html')"/>
    </xsl:variable>

    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>
                <xsl:value-of select="//titleStmt/title"/>
            </title>
            <xsl:element name="meta">
                <xsl:attribute name="name">description</xsl:attribute>
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title"/> par <xsl:value-of
                        select="//titleStmt/author"/>
                </xsl:attribute>
            </xsl:element>
            <meta name="author" content="Natacha Grim"/>

            <style>
                body {
                background-image: url('images/Illu-fond.png');
                background-repeat: no-repeat;
                background-size: cover;
                width: 1100px;
                margin: auto;
                font-family: Arial, Helvetica, sans-serif;
                }
                
                
                h1 {
                color: white;
                border: white groove 5px;
                font-weight: lighter;
                letter-spacing: 2px;
                text-shadow: 1px 1px 10px black;
                background-color: rgba(0, 0, 0, 0.3);
                
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 50px;
                padding-right: 50px;
                
                margin-left: 60px;
                margin-right: 60px;
                }
                
                .box {
                background-color:white;
                box-shadow: 1px 1px 10px black;
                padding:15px 75px 45px 75px;
                }
                
                .container {
                display: flex;
                align-items: center;
                justify-content: center;
                }
                
                .barre {
                width: 100%;
                box-shadow: 1px -1px 10px black;
                background-color:rgba(153, 101, 21, 0.5);
                text-shadow: 1px 1px 10px black;
                position:sticky;
                top:0;
                z-index:3;
                color: white;
                }
                
                nav > ul {
                list-style:none;
                text-align:center;
                
                padding:0;
                margin:0;
                }
                
                ul > li {
                display:inline-block;
                padding:8px;
                margin-top:10px;
                margin-bottom:10px;
                }
                
                nav a {
                display:block;
                justify-content:space-between;
                padding:5px 1px 5px 1px;
                }
                
                figcaption {
                text-align: center;
                font-size: 14px;
                margin-top: 5px;
                }
                
                ul > li > a {
                text-decoration:none;
                color:white;
                transition: 0.3s;
                }
                
                ol > li > a {
                color:black;
                }
                
                a:hover {
                text-shadow: 2px 2px 30px black;
                }
                
                p {
                text-align:justify;
                font-size:17px;
                }
                
                .text {
                padding-left:30px;
                text-align:justify;
                }
                
                * {
                line-height:1.5em;
                }
                
                h1, h2 {
                text-align:center;
                }
                
                img,figcaption {
                margin-left:-30px;
                padding-right:10px;
                }

            </style>

        </head>
    </xsl:variable>

    <xsl:variable name="return_index">
        <a href="Fables-index.html">
            <i>Accueil</i>
        </a>
    </xsl:variable>

    <xsl:variable name="return_fable3">
        <a href="Fables-3.html">
            <i>La Grenouille qui se veut faire aussi grosse que le Bœuf</i>
        </a>
    </xsl:variable>

    <xsl:variable name="return_fable4">
        <a href="Fables-4.html">
            <i>Les deux Mulets</i>
        </a>
    </xsl:variable>

    <xsl:variable name="return_fable5">
        <a href="Fables-5.html">
            <i>Le Loup et le Chien</i>
        </a>
    </xsl:variable>

    <xsl:template match="/">
        <xsl:call-template name="index"/>
    </xsl:template>

    <xsl:template name="index">
        <xsl:result-document href="html/{$index}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <header>
                        <h1><i><xsl:value-of select="//sourceDesc//title"/></i></h1>
                    </header>

                    <div class="barre">
                        <nav>
                            <ul>
                                <li><a href="#{$index}"><xsl:value-of select="$return_index"/></a></li>
                                <li><a href="#fables-encodees">Fables encodées</a></li>
                                <li><a href="{$fable4}" target="_blank"><xsl:value-of select="$return_fable4"/></a></li>
                                <li><a href="{$fable5}" target="_blank"><xsl:value-of select="$return_fable5"/></a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="box">
                        <h2><xsl:value-of select="//publicationStmt/p"/></h2>
                        <div class="container">
                            
                            <div class="image">
                                <img src="images/La-Fontaine.png"
                                    alt="Portrait de Jean de La Fontaine" width="210px" id="trans7"/>
                                <figcaption>
                                    <em>Jean de La Fontaine par Hyacinthe Rigaud, en 1690.</em>
                                </figcaption>
                            </div>
                            <div class="text">
                                <p>L'œuvre de <b>Jean de La Fontaine</b> demeure un fleuron de la
                                    littérature classique française et continue, à ce titre,d'être
                                    enseignée aux plus jeunes comme aux étudiants dans le cadre
                                    d'études supérieures. Les fables ont <i>ipso facto</i>
                                    fait l'objet de quantité d'éditions. Aussi, nous avons choisi de
                                    prendre pour base une édition de 1668 et d'en moderniser
                                    l'orthographe afin d'en rendre la lecture accessible dès le plus
                                    jeune âge en conservant la syntaxe d'époque.</p>
                                <p><xsl:value-of select="//encodingDesc//p[1]"/></p>
                                <p><xsl:value-of select="//encodingDesc//p[2]"/></p>
                            </div>
                        </div>
                        <h2 id="fables-encodees">Fables encodées</h2>
                        <ol>
                            <li><a href="{$fable3}" target="_blank"><xsl:value-of select="$return_fable3"/></a></li>
                            <li><a href="{$fable4}" target="_blank"><xsl:value-of select="$return_fable4"/></a></li>
                            <li><a href="{$fable5}" target="_blank"><xsl:value-of select="$return_fable5"/></a></li>
                        </ol>
                    </div>

                </body>
            </html>
        </xsl:result-document>
    </xsl:template>






</xsl:stylesheet>
