<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <!-- VARIABLES -->
    
    <!-- Mode de sortie : en HTML, conservation de l'indentation, encodage en UTF-8, déclaration du DOCTYPE -->
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>

    <!-- Nom du fichier de sortie pour la page d'accueil -->
    <xsl:variable name="index">
        <xsl:value-of select="concat('fablesIndex', '.html')"/>
    </xsl:variable>
    
    <!-- Texte renvoyant vers la page d'accueil dans la barre de navigation -->
    <xsl:variable name="return_index">Accueil</xsl:variable>
        
    <!-- Métadonnées et style des fichiers HTML -->
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
                html {
                scroll-behavior: smooth;
                }
                
                body {
                background-image: url('images/Illu-fond.png');
                background-repeat: no-repeat;
                background-size: cover;
                width: 1100px;
                margin: auto;
                font-family: Arial, Helvetica, sans-serif;
                }
                
                @font-face {
                font-family: heavyrain;
                src: url(HeavyRain/HeavyRain_PERSONAL_USE_ONLY.ttf);
                }
                
                h1 {
                color: black;
                font-family: heavyrain;
                font-size: 40px;
                letter-spacing: 2px;
                text-shadow: 0 0 2px white;
                
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 50px;
                padding-right: 50px;
                
                margin-left: 60px;
                margin-right: 60px;
                }
                
                .title-fable {
                margin-left: 35px;
                margin-right: 35px;
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
                color:blue;
                transition: 0.3s
                }
                
                ul > li > a:hover {
                text-shadow: 0 0 10px white;
                color: black;
                }
                
                ol > li > a:hover {
                color: black;
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
                
                img {
                filter: drop-shadow(0 0 0.75rem black);
                }
                
                table {
                border-collapse: collapse;
                border: outset 5px;
                margin: auto;
                }
                
                th, td {
                padding: 15px;
                border: outset 5px;
                background-color: rgba(255, 215, 0, 0.1);
                }
                
                .boxEnd {
                background-color: rgba(153, 101, 21, 0.7);
                border: ridge white 2px;
                box-shadow: 1px -1px 10px black;
                text-align: center;
                position: relative;
                text-shadow: 2px 2px 30px black;
                z-index: 1;
                padding: 10px 0;
                margin: 10px auto;
                display: table;
                width: auto;
                color: white;
                letter-spacing: 1px;
                }
                
                .boxEnd > p {
                display: table-cell;
                text-align: center;
                vertical-align: middle;
                text-shadow: 2px 2px 5px black;
                margin: 0;
                padding: 0 10px;
                font-size: small;
                }
                
                .boxEnd > p > a {
                text-decoration: none;
                color: white;
                transition: 0.3s;
                }
                
                .boxEnd > p > a:hover {
                text-shadow: 0 0 10px white;
                color: black;
                }
            </style>
        </head>
    </xsl:variable>

    <!-- FICHIERS DE SORTIE -->

    <!-- Appel de tous les templates de fichiers de sortie -->
    <xsl:template match="/">
        <xsl:call-template name="index"/>
        <xsl:call-template name="fables"/>
    </xsl:template>
    
    <!-- PAGE D'ACCUEIL -->
    
    <xsl:template name="index">
        <xsl:result-document href="html/{$index}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <!-- Titre majeur de la page -->
                    <header>
                        <h1><xsl:value-of select="//sourceDesc//title"/></h1>
                    </header>
                    <!-- Barre de navigation -->
                    <div class="barre">
                        <nav>
                            <ul>
                                <li><a href="#fables-encodees">Fables encodées</a></li>
                                <li><a href="https://gallica.bnf.fr/ark:/12148/btv1b8610825d/f1" target="_blank">Consulter l'édition encodée</a></li>
                                <li><a href="https://fr.wikipedia.org/wiki/Jean_de_La_Fontaine" target="_blank">Sur Jean de La Fontaine</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- Corps du contenu de la page -->
                    <div class="box">
                        <h2><xsl:value-of select="//publicationStmt/p"/></h2>
                        <div class="container">
                            
                            <div class="image">
                                <img src="images/La-Fontaine.png"
                                    alt="Portrait de Jean de La Fontaine" width="210" id="trans7"/>
                                <figcaption>
                                    <em>Jean de La Fontaine par Hyacinthe Rigaud, en 1690.</em>
                                </figcaption>
                            </div>
                            <div class="text">
                                <p>L'œuvre de <b>Jean de La Fontaine</b> demeure un fleuron de la
                                    littérature classique française et continue, à ce titre, d'être
                                    enseignée aux plus jeunes comme aux étudiants dans le cadre
                                    d'études supérieures. Les fables ont <i>ipso facto</i>
                                    fait l'objet de quantité d'éditions. Aussi, nous avons choisi de
                                    prendre pour base une édition de 1668 et d'en moderniser
                                    l'orthographe afin d'en rendre la lecture accessible dès le plus
                                    jeune âge en conservant la syntaxe d'époque.</p>
                                <xsl:apply-templates select="//encodingDesc"/>
                            </div>
                        </div>
                        <!-- Liste cliquable de l'ensemble des fables encodées -->
                        <h2 id="fables-encodees">Fables encodées</h2>
                        <ol>
                            <xsl:for-each select="//body/div">
                                <xsl:variable name="n">
                                    <xsl:number count="div" from="body"/>
                                </xsl:variable>
                                <li><a href="{concat('fable', $n+2, '.html')}" target="_blank"><xsl:apply-templates select="head"/></a></li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- PAGE DES FABLES -->
    
    <xsl:template name="fables">
        <!-- Boucle générant un fichier HTML par fable -->
        <xsl:for-each select="//body/div">
            <!-- Compteur permettant de générer le nom des fichiers de sortie et les liens de navigation interne -->
            <xsl:variable name="n" select="position() + 2">
            </xsl:variable>
            <xsl:result-document href="{concat('html/fable', $n, '.html')}">
                <xsl:copy-of select="$header"/>
                <html lang="fr">
                    <body>
                        <!-- Titre modernisé de la fable -->
                        <header>
                            <h1 class="title-fable"><xsl:apply-templates select="head"/></h1>
                        </header>
                        <!-- Barre de navigation -->
                        <div class="barre">
                            <nav>
                                <ul>
                                    <li><a href="{$index}" target="_blank"><xsl:value-of select="$return_index"/></a></li>
                                    <li><a href="https://gallica.bnf.fr/ark:/12148/btv1b8610825d/f1" target="_blank">Consulter l'édition encodée</a></li>
                                    <li><a href="https://fr.wikipedia.org/wiki/Jean_de_La_Fontaine" target="_blank">Sur Jean de La Fontaine</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Corps du contenu de la page -->
                        <div class="box">
                            <h2>Lecture comparée</h2>
                            <table border="1">
                                <tr>
                                    <th>Version modernisée</th>
                                    <th>Version originale</th>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:apply-templates select="lg"/>
                                    </td>
                                    <td>
                                        <xsl:apply-templates select="lg" mode="orig"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- Pied de page permettant de naviguer entre les fables -->
                        <footer>
                            <!-- Si une fable précède celle de la page courante, création d'un lien de renvoi -->
                            <xsl:if test="preceding-sibling::div">
                                <div class="boxEnd">
                                    <p><a href="{concat('fable', $n - 1, '.html')}" target="_blank">◄ Page précédente : <i><xsl:apply-templates select="preceding-sibling::div[1]/head"/></i></a></p>
                                </div>
                            <!-- Si une fable succède celle de la page courante, création d'un lien de renvoi -->
                            </xsl:if>
                            <xsl:if test="following-sibling::div">
                                <div class="boxEnd">
                                    <p><a href="{concat('fable', $n + 1, '.html')}" target="_blank">► Page suivante : <i><xsl:apply-templates select="following-sibling::div[1]/head"/></i></a></p>
                                </div>
                            </xsl:if>      
                        </footer>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="lg">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match="choice">
        <xsl:apply-templates select="reg"/>
    </xsl:template>

    <xsl:template match="lg" mode="orig">
        <p><xsl:apply-templates mode="orig"/></p>
    </xsl:template>
    
    <xsl:template match="l" mode="orig">
        <xsl:apply-templates mode="orig"/><br/>
    </xsl:template>
    
    <xsl:template match="choice" mode="orig">
        <xsl:apply-templates select="orig"/>
    </xsl:template>

</xsl:stylesheet>