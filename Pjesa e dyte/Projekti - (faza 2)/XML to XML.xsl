<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
    <xsl:template match = "InstitutiHidrometeorogjik">
        <InstitutiHidrometeorogjik>
            <xsl:apply-templates/>
        </InstitutiHidrometeorogjik>
    </xsl:template>
    
    <!-- Fillimi i tabeles StacionetMeteorologjike -->
    <xsl:template match = "StacionetMeteorologjike">
        <StacionetMeteorologjike>
            <xsl:element name = "StacioniID">
                <xsl:value-of select = "@id"/>
            </xsl:element>
            <xsl:element name = "EmriStacionit">
                <xsl:value-of select = "EmriStacionit"/>
            </xsl:element>
            <xsl:element name = "Kordinatat">
                <xsl:attribute name="Gjatesia">
                    <xsl:value-of select="Kordinatat/Gjatesia_Gjeografike" />
                </xsl:attribute>
                <xsl:attribute name="Gjeresia">
                    <xsl:value-of select="Kordinatat/Gjeresia_Gjeografike" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name = "LartesiaMbidetare">
                <xsl:value-of select = "LartesiaMbidetare"/>
            </xsl:element>
            <xsl:element name = "PellguLumor">
                <xsl:value-of select = "PellguLumor"/>
            </xsl:element>
        </StacionetMeteorologjike>
    </xsl:template>
    
    <!-- Fundi i tabeles StacionetMeteorologjike -->
    
    
    <!--Fillimi i tabeles TeDhenatKlimatologjike -->
    <xsl:template match = "TeDhenatKlimatologjike">
        <TeDhenatKlimatologjike>
            <xsl:attribute name="Kid">
                <xsl:value-of select="Kid" />
            </xsl:attribute>
            <xsl:element name = "StacioniID">
                <xsl:value-of select = "StacioniID"/>
            </xsl:element>
            <xsl:for-each select="KMatje">
                <xsl:element name = "KMatje">
                    <xsl:attribute name="dataKoha">
                        <xsl:value-of select="concat(@data,' ', Koha )" />
                    </xsl:attribute>
                    <xsl:attribute name="temperatura">
                        <xsl:value-of select="Temperatura" />
                    </xsl:attribute>
                    <xsl:attribute name="shtypjaAjrit">
                        <xsl:value-of select="Shtypja_Ajrit" />
                    </xsl:attribute>
                    <xsl:attribute name="lageshtiaAjrit">
                        <xsl:value-of select="Lageshtia_Ajrit" />
                    </xsl:attribute>
                    <xsl:attribute name="reshjeShiu">
                        <xsl:value-of select="Reshje_Shiu" />
                    </xsl:attribute>
                    <xsl:attribute name="reshjeBore">
                        <xsl:value-of select="Reshje_Bore" />
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>
            <xsl:element name = "Insolacioni">
                <xsl:value-of select = "Insolacioni"/>
            </xsl:element>
            <xsl:element name = "Vranesirat">
                <xsl:value-of select = "Vranesirat"/>
            </xsl:element>
        </TeDhenatKlimatologjike>
    </xsl:template>
    
    <!--Fundi i tabeles TeDhenatKlimatologjike -->
    
    
    
    <!--Fillimi i tabeles TemperaturaTokes -->
    
    <xsl:template match = "TemperaturaTokes">
        <TemperaturaTokes>
            <xsl:attribute name="tempID">
                <xsl:value-of select="TempID" />
            </xsl:attribute>
            <xsl:element name = "StacioniID">
                <xsl:value-of select = "StacionId"/>
            </xsl:element>
            <xsl:for-each select="Temperaturat">
                <xsl:element name = "Temperaturat">
                    <xsl:attribute name="dataKoha">
                        <xsl:value-of select="Data-Koha" />
                    </xsl:attribute>
                    <xsl:attribute name="temperaturaTokes">
                        <xsl:value-of select="Temperatura_Tokes" />
                    </xsl:attribute>
                    <xsl:attribute name="thellesiaTokes">
                        <xsl:value-of select="Thellesia_Tokes" />
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </TemperaturaTokes>
    </xsl:template>
    
    <!--Fundi i tabeles TemperaturaTokes -->
    
    
    <!--Fillimi i tabeles StacionetHidrometrike-->
    <xsl:template match = "StacionetHidrometrike">
        <StacionetHidrometrike>
            <xsl:element name = "hidroStacioniID">
                <xsl:value-of select = "@id"/>
            </xsl:element>
            <xsl:element name = "EmriStacionit">
                <xsl:value-of select = "Emri-Stacionit"/>
            </xsl:element>
            <xsl:element name = "PellguLumor">
                <xsl:value-of select = "Pellgu-Lumor"/>
            </xsl:element>
            <xsl:element name = "Lumi">
            <xsl:value-of select = "Lumi"/>
            </xsl:element>
                <xsl:element name = "Kordinatat">
                    <xsl:attribute name="Gjatesia">
                        <xsl:value-of select="Kordinatat/Gjatesia_Gjeografike" />
                    </xsl:attribute>
                    <xsl:attribute name="Gjeresia">
                        <xsl:value-of select="Kordinatat/Gjeresia_Gjeografike" />
                    </xsl:attribute>
                </xsl:element>
            <xsl:element name = "LartesiaMbidetare">
                <xsl:value-of select = "Lartesia_Mbidetare"/>
            </xsl:element>
        </StacionetHidrometrike>
    </xsl:template>
    
    <!--Fundi i tabeles StacionetHidrometrike -->
    
    
    <!--Fillimi i tabeles TeDhenatHidrometrike -->
    
    <xsl:template match = "TeDhenatHidrometrike">
        <TeDhenatHidrometrike>
            <xsl:attribute name="id">
                <xsl:value-of select="@id" />
            </xsl:attribute>
            <xsl:element name = "HidroStacioniID">
                <xsl:value-of select = "HidroStacioniID"/>
            </xsl:element>
            <xsl:element name = "DistancaNgaGryka">
                <xsl:value-of select = "DistancaNgaGryka"/>
            </xsl:element>
            <xsl:element name = "SiperfaqjaUjembledhese">
                <xsl:value-of select = "SiperfaqjaUjembledhese"/>
            </xsl:element>
            <xsl:for-each select="HMatjet">
                <xsl:element name = "HMatjet">
                    <xsl:attribute name="dataKoha">
                        <xsl:value-of select="DataKoha" />
                    </xsl:attribute>
                    <xsl:attribute name="niveliUjit">
                        <xsl:value-of select="NiveliUjit" />
                    </xsl:attribute>
                    <xsl:attribute name="PrurjaUjit">
                        <xsl:value-of select="PrurjaUjit" />
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </TeDhenatHidrometrike>
    </xsl:template>
    
    <!--Fundi i tabeles TeDhenatHidrometrike -->
    
    <!--Fillimi i tabeles Zhurma -->
    
    <xsl:template match = "Zhurma">
        <Zhurma>
            <xsl:element name = "ZhurmaID">
                <xsl:value-of select = "@id"/>
            </xsl:element>
            <xsl:element name = "DataKoha">
                <xsl:value-of select = "Data_Koha"/>
            </xsl:element>
            <xsl:element name = "TipiPranuesit">
                <xsl:value-of select = "TipiPranuesit"/>
            </xsl:element>
            <xsl:element name = "VleraZhurmes">
                <xsl:value-of select = "VleraZhurmes"/>
            </xsl:element>
            
        </Zhurma>
    </xsl:template>
    
    <!--Fundi i tabeles Zhurma-->
</xsl:stylesheet>

