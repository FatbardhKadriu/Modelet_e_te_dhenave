<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body {
                    background-color: bisque;
                    }
                    table tr th {
                    padding: 15px;
                    }
                    table {
                    border-collapse: collapse;
                    }
                    tr,
                    th,
                    td {
                    border: 1px solid rgb(15, 127, 196);
                    padding: 4px;
                    }
                    tr:hover{
                    background-color: #f5f5f5;
                    }
                </style>
            </head>
            <body>
                <h2>Stacionet Meteorologjike</h2>
                <table border="1">
                    <xsl:for-each select="InstitutiHidrometeorogjik/StacionetMeteorologjike">
                        <tr style="background-color:#A12424; color:white;">
                            <th>Emri Stacionit</th>
                            <th>Kordinatat</th>
                            <th>Lartesia Mbidetare</th>
                            <th>Pellgu Lumor</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="EmriStacionit"/></td>
                            <td><table border="1">
                                <tr><th>Gjeresia</th><th>Gjatesia</th></tr>
                                <tr>
                                    <td><xsl:value-of select="Kordinatat/Gjeresia_Gjeografike"/></td>
                                    <td><xsl:value-of select="Kordinatat/Gjatesia_Gjeografike"/></td>
                                </tr>
                            </table></td>
                            <td><xsl:value-of select="LartesiaMbidetare"/></td>
                            <td><xsl:value-of select="PellguLumor"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                
                <h2>Te dhenat Klimatologjike</h2>
                <table border="1">
                    <tr style="background-color:#A12424; color:white;">
                        <th>StacioniID</th>
                        <th>Matjet</th>
                        <th>Insolacioni</th>
                        <th>Vranesirat</th>
                    </tr>
                    <xsl:for-each select="InstitutiHidrometeorogjik/TeDhenatKlimatologjike">
                        <tr>
                            <td><xsl:value-of select="StacioniID" /></td>
                            <td>
                                <table border="1">
                                    <tr>
                                        <th>Data</th>
                                        <th>Koha</th>
                                        <th>Temperatura</th>
                                        <th>Shtypja e ajrit</th>
                                        <th>Lageshtia e ajrit</th>
                                        <th>Reshje shiu</th>
                                        <th>Reshje bore</th></tr>
                                    
                                    <xsl:for-each select="KMatje">
                                        <tr>
                                            <td><xsl:value-of select="@data" /></td>
                                            <td><xsl:value-of select="Koha" /></td>
                                            <td><xsl:value-of select="Temperatura" /></td>
                                            <td><xsl:value-of select="Shtypja_Ajrit" /></td>
                                            <td><xsl:value-of select="Lageshtia_Ajrit" /></td>
                                            <td><xsl:value-of select="Reshje_Shiu" /></td>
                                            <td><xsl:value-of select="Reshje_Bore" /></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                            <td><xsl:value-of select="Insolacioni" /></td>
                            <td><xsl:value-of select="Vranesirat" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>Temperatura e Tokes</h2>
                <table border="1">
                    <tr style="background-color:#A12424; color:white;">
                        <th>Temperatura ID</th>
                        <th>Stacioni ID</th>
                        <th>Temperatura</th>
                    </tr>
                    <xsl:for-each select="InstitutiHidrometeorogjik/TemperaturaTokes">
                        <tr>
                            <td><xsl:value-of select="TempID" /></td>
                            <td><xsl:value-of select="StacionId" /></td>
                            <td>
                                
                                <table border="1">
                                    <tr>
                                        <th>Data dhe koha</th>
                                        <th>Temperatura e Tokes</th>
                                        <th>Thellesia e Tokes</th>
                                    </tr>
                                    <xsl:for-each select="Temperaturat">
                                        <tr>
                                            <td><xsl:value-of select="Data-Koha" /></td>
                                            <td><xsl:value-of select="Temperatura_Tokes" /></td>
                                            <td><xsl:value-of select="Thellesia_Tokes" /></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                
                <h2>Stacionet Hidrometrike</h2>
                <table border="1">
                    <tr style="background-color:#A12424; color:white;">
                        <th>Stacioni ID</th>
                        <th>Emri i Stacionit</th>
                        <th>Pellgu Lumor</th>
                        <th>Lumi</th>
                        <th>Kordinatat</th>
                        <th>Lartesia Mbidetare</th>
                    </tr>
                    
                    <xsl:for-each select="InstitutiHidrometeorogjik/StacionetHidrometrike ">
                        <tr>
                            <td><xsl:value-of select="@id" /></td>
                            <td><xsl:value-of select="Emri-Stacionit" /></td>
                            <td><xsl:value-of select="Pellgu-Lumor" /></td>
                            <td><xsl:value-of select="Lumi" /></td>
                            <td>
                                <table border="1">
                                    <tr><th>Gjeresia gjeografike</th>
                                        <th>Gjatesia gjeografike</th></tr>
                                    <tr> 
                                        <td><xsl:value-of select="Kordinatat/Gjeresia_Gjeografike" /></td>
                                        <td><xsl:value-of select="Kordinatat/Gjatesia_Gjeografike" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td><xsl:value-of select="Lartesia_Mbidetare" /></td>       
                        </tr>
                    </xsl:for-each>
                </table>
                
                
                <h2>Te dhenat Hidrometrike</h2>
                <table border="1">
                    <tr style="background-color:#A12424; color:white;">
                        <th>Matja ID</th>
                        <th>HidroStacioni ID</th>
                        <th>Distanca nga gryka</th>
                        <th>Siperfaqja ujembledhese</th>
                        <th>Matjet</th>
                    </tr>
                    <xsl:for-each select="InstitutiHidrometeorogjik/TeDhenatHidrometrike">
                        <tr>
                            <td><xsl:value-of select="@id" /></td>
                            <td><xsl:value-of select="HidroStacioniID" /></td>
                            <td><xsl:value-of select="DistancaNgaGryka" /></td>
                            <td><xsl:value-of select="SiperfaqjaUjembledhese" /></td>
                            <td>
                                <table border="1">
                                    <tr>
                                        <th>Data dhe koha</th>
                                        <th>Niveli i ujit</th>
                                        <th>Prurja e ujit</th></tr>
                                    
                                    <xsl:for-each select="HMatjet">
                                        <tr>
                                            <td><xsl:value-of select="DataKoha" /></td>
                                            <td><xsl:value-of select="NiveliUjit" /></td>
                                            <td><xsl:value-of select="PrurjaUjit" /></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h2>Zhurma</h2>
                <table border="1">
                    <tr style="background-color:#A12424; color:white;">
                        <th>Zhurma ID</th>
                        <th>Data dhe koha</th>
                        <th>Tipi i pranuesit</th>
                        <th>Vlera e zhurmes</th>
                    </tr>
                    <xsl:for-each select="InstitutiHidrometeorogjik/Zhurma ">
                        <tr>
                            <td><xsl:value-of select="@id" /></td>
                            <td><xsl:value-of select="Data_Koha" /></td>
                            <td><xsl:value-of select="TipiPranuesit" /></td>
                            <td><xsl:value-of select="VleraZhurmes" /></td> 
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
