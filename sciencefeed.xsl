<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:media="http://search.yahoo.com/mrss/">

<xsl:output method="html"/>


<!-- start processing                                                   -->
<!-- ////////////////////////////////////////////////////////////////// --> 
<xsl:template match="/">

<html>
<head>

<link rel="stylesheet" type="text/css" href="feedapp/feed.css"></link>
<link rel="stylesheet" type="text/css" href="feedapp/modal.css"></link>

<script 
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

</head>

<body>
<div class="container">

<header>
   <h1><xsl:value-of select="//channel/title"/></h1>
   <p><xsl:value-of select="//channel/description"/></p>
   <p><xsl:value-of select="//channel/pubDate"/></p>
</header>

<nav>
<ul>
    <li><a href="#">Databases</a></li>
    <li><a href="#">Isosurfaces</a></li>
    <li><a href="#">Eddies</a></li>
</ul>
</nav>

<xsl:apply-templates select="/rss/channel/item"/>

<div id="modalPanel" class="modal">
    <span class="close">x</span>
    <img class="modal-content" id="modalContent"></img>
    <div id="modalCaption"></div>
</div>

<footer>Copyright (c) 2018 Los Alamos National Laboratory</footer>

</div>

<script>
<xsl:text>

$(".mimg").onclick(function() {
    alert("message");
});

<!-- Get the <span> element that closes the modal -->
var span = document.getElementsByClassName("close")[0];

<!-- When the user clicks on <span> (x), close the modal -->
span.onclick = function() { 
    var modal = document.getElementById('modalPanel');
    modal.style.display = "none";
}

</xsl:text>
</script>

</body>
</html>
</xsl:template>

<!-- templates -->
<xsl:template match="item">
<article>
<a>
    <xsl:attribute name="href">
        <xsl:value-of select="link"/>
    </xsl:attribute>
    <strong><xsl:value-of select="title"/></strong>
</a>
<table>
<tr>
<td>
    <img class="mimg">
    <xsl:attribute name="src">
        <xsl:value-of select="media:thumbnail/@url"/>
    </xsl:attribute>
    </img>
</td>
    <xsl:for-each select="media:storyboard/image">
    <td>
            <img class="mimg">
            <xsl:attribute name="src">
                <xsl:value-of select="current()"/>
            </xsl:attribute>
            </img>
    </td>
    </xsl:for-each>

</tr>
</table>
</article>
</xsl:template>

</xsl:stylesheet>
