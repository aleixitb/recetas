<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    CSS ROUTES IN XML

    <?xml-stylesheet type="text/css" href="css/main.css"?>
    <?xml-stylesheet type="text/css" href="css/receta.css"?>
    <?xml-stylesheet type="text/css" href="css/index.css"?>

    XPATH

    VAR NUMERO: <xsl:variable name="numero" select="1"></xsl:variable>

    VALUE-OF CATEGORIA: <xsl:value-of select="receptes/recepta[@id=$numero]/categoria"></xsl:value-of> 

    VALUE-OF TÍTOL: <xsl:value-of select="receptes/recepta[@id=$numero]/nom"></xsl:value-of>

    VALUE-OF COMENÇALS: <xsl:value-of select="receptes/recepta/informacio_general/comensals"></xsl:value-of>

    VALUE-OF TEMPS: <xsl:value-of select="receptes/recepta/informacio_general/temps"></xsl:value-of>

    VALUE-OF DIFICULTAT: <xsl:value-of select="receptes/recepta/informacio_general/dificultat"></xsl:value-of>
    
    FOR-EACH INGREDIENT:

        <xsl:for-each select="receptes/recepta[@id=$numero]/ingredients/ingredient">

            <li>

                <xsl:value-of select="."></xsl:value-of>

            </li>

        </xsl:for-each> 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes" />

    <xsl:template match="/recepta">

        <!-- CATEGORIA -->

                <xsl:apply-templates select="categoria"></xsl:apply-templates>

                <!-- NOM -->
                <xsl:apply-templates select="nom"></xsl:apply-templates>
            
                <!-- FOTO_-->
                <xsl:apply-templates select="foto"></xsl:apply-templates>

                <!--INFORMACIÓ GENERAL: COMENSALS, TEMPS, DIFICULTAT -->
                <xsl:apply-templates select="informacio_general"></xsl:apply-templates>

                <!-- INGREDIENTS -->
                <xsl:apply-templates select="ingredients"></xsl:apply-templates>

                <!-- PREPARACIO -->
                <xsl:apply-templates select="preparacio"></xsl:apply-templates>

            </xsl:template>

        <!-- TEMPLATES D'ON AGAFO LES DADES -->

            <!-- CATEGORIA-->
            <xsl:template match="categoria">
                <div class="categoria">
                    Recetas de <xsl:value-of select="."></xsl:value-of>
                </div>
            </xsl:template>

            <!-- NOM -->
            <xsl:template match="nom">
                <h2 class="nom">
                    <xsl:value-of select="."></xsl:value-of>
                </h2>
            </xsl:template>

            <!-- INFORMACIÓ GENERAL -->
            <xsl:template match="informacio_general">
                <div class="informacioGeneral">

                    <!-- FOTO -->
                    <img class="foto">
                        <xsl:attribute name="src">
                            <xsl:value-of select="foto"></xsl:value-of>
                        </xsl:attribute>
                    </img>

                    <!-- INFORMACIÓ GENERAL -->
                    <div class="infoDins">
                        <div>Comensals:</div> 
                        <xsl:value-of select="comensals"></xsl:value-of>

                        <div>Temps: </div>
                        <xsl:value-of select="temps"></xsl:value-of>

                        <div>Dificultat: </div>
                        <xsl:value-of select="dificultat"></xsl:value-of>
                    </div>
                </div>
            </xsl:template>

            <!-- INGREDIENTS  -->
            <xsl:template match="ingredients">
                <div class="ingredients">
                    <div style="font-weight: bolder;">Ingredients:</div>
                    <ul>
                        <xsl:for-each select="ingredient">

                            <li>
                                <xsl:value-of select="@quantitat"></xsl:value-of>
                                    <xsl:text> </xsl:text>
                                <xsl:value-of select="@unitat"></xsl:value-of>
                                    <xsl:text> </xsl:text>
                                <xsl:value-of select="."></xsl:value-of>
                            </li>

                        </xsl:for-each>
                    </ul>
                </div>
            </xsl:template>

            <!-- PREPARACIO -->
            <xsl:template match="preparacio">
                <div class="preparacio">
                    <div style="font-weight: bolder; text-align: center;">Preparació:</div>
                    <ol class="lista">
                        <xsl:for-each select="pas">

                            <li class="elements">

                                <div class="pas"><xsl:value-of select="."></xsl:value-of></div>

                            </li>

                        </xsl:for-each>
                    </ol>
                </div>
            </xsl:template>

</xsl:stylesheet>