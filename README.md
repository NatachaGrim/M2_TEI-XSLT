# À propos

Ce dépôt contient l'ensemble des fichiers requis pour l'évaluation des cours de XML-TEI et d'XSLT dispensés en deuxième année de Master TNAH à l'École nationale des chartes.

Le sujet porte sur trois fables de Jean de La Fontaine issues de l'ouvrage [Fables choisies, mises en vers par M. de La Fontaine](https://gallica.bnf.fr/ark:/12148/btv1b8610825d/f4.item). Le projet d'encodage consiste en une modernisation de l’orthographe afin d'en rendre la lecture accessible en conservant la syntaxe d'époque.

## Détail du contenu

### Encodage en XML-TEI

- Un [document XML-TEI](TEI-Fables.xml) où sont encodées les fables choisies ;
- Un [fichier ODD](ODD_TEI-Fables.xml) présentant le projet éditorial et les contraintes d'encodage ;
- Un [schéma RNG](out/ODD_TEI-Fables.rng) généré à partir de l'ODD ;
- Une [version html](ODD_TEI-Fables.html) de l'ODD.

### Transformation vers HTML

- Une [feuille de style](XSLT-Fables.xsl) rédigée en XSLT servant à transformer le document TEI ;
- Un [dossier](html) contenant le résultat de la transformation en HTML, correspondant à un site web comprenant :
  - Une [page d'accueil](html/fablesIndex.html) ;
  - Une lecture comparée de [_La Grenouille qui se veut faire aussi grosse que le Bœuf_](html/fable3.html) ;
  - Une lecture comparée de [_Les deux Mulets_](html/fable4.html) ;
  - Une lecture comparée de [_Le Loup et le Chien_](html/fable5.html) ;
