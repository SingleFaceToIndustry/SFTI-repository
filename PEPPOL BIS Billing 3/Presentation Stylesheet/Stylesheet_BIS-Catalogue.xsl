<?xml version="1.0" encoding="UTF-8"?>
<!--
******************************************************************************************************************

		title= Peppol BIS Ordering, Order Transaction - Reference stylesheet
		Version of this reference stylesheet: 1.0 
		publisher= SFTI
		conformsTo= UBL-Catalogue-2.1.xsd 

		The assumption is that is that the stylesheet is applied to messages that are formally correct, i.e. 
		messages that comply with XML schema and schematron rules. However, as this reference stylesheet is 
		likely to be used also in test environments, some basic validation features have been included, 
		and any consequential errors are displayed as needed."
		
		Derived from work by SFTI tekniska kansli, Sweden
		
******************************************************************************************************************
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" xmlns:cdl="http://docs.oasis-open.org/codelist/ns/genericode/1.0/" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:sdt="urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="n1 cdl cac cbc ccts sdt udt">
  <xsl:import href="CommonTemplates.xsl"/>
  <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="stylesheet_url" select="'NONE'"/>
  <xsl:template name="doc-head">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <xsl:choose>
      <xsl:when test="$stylesheet_url = 'NONE'">
        <style>* {
    box-sizing: border-box;
}

:root {
  --white: #ffffff;
  --grey: #f3f3f2;
  --Line-color: #979797;
  --font-color: #484848;
}

/* Text styles */

h1 {
  font-family: Helvetica;
  font-size: 3.3vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 3.5vw;
  letter-spacing: normal;
  color: #484848;
}

h2 {
  font-family: Helvetica;
  font-size: 2.4vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 2.5vw;
  letter-spacing: normal;
  color: #484848;
  margin:0px;
}

h3 {
  font-family: Helvetica;
  font-size: 1.9vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 2vw;
  letter-spacing: normal;
  color: #484848;
  margin:0px;
}


h4 {
  font-family: Helvetica;
  font-size: 1.3vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.5vw;
  letter-spacing: normal;
  color: #484848;
  margin:0px;
}

p,th,td {
  font-family: Helvetica;
  font-size: 1.2vw;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.5vw;
  letter-spacing: normal;
  color: #484848;
  margin-top:0.5vw;
  margin-bottom:0.5vw;
}


table
{
	
	/*border: 2px solid black;*/
	width: 100%;
	
}
table, th, td
{
border-collapse: collapse;
}
tr
{
	vertical-align: top;
}
tr:nth-child(even) {
    background-color: #f3f3f2;
}

td
{
	vertical-align: top;
	border-bottom:1px solid #979797;
	/*border:2px solid black;*/
}


th
{
	border-bottom: 2px solid #979797;
	font-weight:normal;
}


td.UBLLine
{
	color:#979797;
	margin: 0em;
}

hr
{
color:var(--Line-color);

}



.col-1 {width: 8.33%;}
.col-2 {width: 16.66%;}
.col-3 {width: 25%;}
.col-4 {width: 33.33%;}
.col-5 {width: 41.66%;}
.col-6 {width: 50%;}
.col-7 {width: 58.33%;}
.col-8 {width: 66.66%;}
.col-9 {width: 75%;}
.col-10 {width: 83.33%;}
.col-11 {width: 91.66%;}
.col-12 {width: 100%;}

[class*="col-"] {
    float: left;
    padding: 1px;
	margin-top:1px;
	border: solid 0px #979797;
}

.row::after {
    content: "";
    clear: both;
    display: table;
}
#bottomrow{

border-bottom:2px solid #979797;
}
#wrapper{
padding:1vw;
border: 1px solid #979797;
}
#footer
{
border-top: 2px solid #979797;
background-color: #f3f3f2;
padding:0px;
margin-top:1vw;
}
#header
{
padding: 0.5vw;
}
#headerrow
{
padding-top:1vw;
border-bottom:1px solid #979797;
}
#tablerow
{
padding-top:1vw;
}

</style>
      </xsl:when>
      <xsl:otherwise>
        <link rel="stylesheet" href="{$stylesheet_url}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="n1:Catalogue">
    <!-- Start HTML -->
    <html>
      <xsl:call-template name="doc-head"/>
      <head>
        <link rel="Stylesheet" type="text/css" href="PEPPOL.css"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <title>PEPPOL BIS 3 Catalogue</title>
      </head>
      <body>
        <div id="wrapper">
          <!-- Start on Order Type row-->
          <div class="row" id="bottomrow">
            <div class="col-6">

              <h2 style="margin-bottom:0px">
                <xsl:call-template name="DocumentHeader">
                  <xsl:with-param name="DocumentCode" select="local-name(.)"/>
                </xsl:call-template>
              </h2>
              <h3 style="margin-top:0px">
                <xsl:call-template name="DocumentCode">
                  <xsl:with-param name="DCode" select="cbc:OrderTypeCode"/>
                </xsl:call-template>
              </h3>
              <h1>
                    <xsl:value-of select="cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
              </h1>
            </div>
            <div class="col-6" id="header">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-006'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Catalogue Date -->
                  <xsl:value-of select="cbc:IssueDate"/>&#160;<xsl:value-of select="cbc:IssueTime"/>
                  <br/>
                </p>
                <xsl:if test="cac:ValidityPeriod/cbc:StartDate">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-007'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cac:ValidityPeriod/cbc:StartDate"/>
                    <br/>
                  </p>
                </xsl:if>
                <xsl:if test="cac:ValidityPeriod/cbc:EndDate">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-008'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cac:ValidityPeriod/cbc:EndDate"/>
                    <br/>
                  </p>
                </xsl:if>
                 <xsl:if test="cbc:ActionCode">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-047'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cbc:ActionCode"/>
                    <br/>
                  </p>
                </xsl:if>
              </div>
              <!--Start of Catalogue Header Information:-->
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-003'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <!-- Inserting Catalogue ID -->
                  <br/>
                  <xsl:value-of select="cbc:ID"/>
                  <br/>
                </p>
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-005'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Catalogue Name  -->
                  <xsl:value-of select="cbc:Name"/>
                  <br/>
                </p>
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-028'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting referenced Contract:  -->
                  <xsl:value-of select="cac:ReferencedContract/cbc:ID"/>
                  <br/>
                </p>
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-004'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Catalogue Version  -->
                  <xsl:value-of select="cbc:VersionID"/>
                  <br/>
                </p>
              </div>
            </div>
            <!--End of Order Header Information-->
          </div>
          <div class="row" id="headerrow">
            <div class="col-6">
              <!-- Inserting Receiver Party -->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir19-ReceiverParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-012'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ReceiverParty/cbc:EndpointID"/>
					<xsl:if test="cac:ReceiverParty/cbc:EndpointID/@schemeID">
						[<xsl:value-of select="cac:ReceiverParty/cbc:EndpointID/@schemeID"/>]
					</xsl:if>
				<br/>  
				<xsl:if test="cac:ReceiverParty/cac:PartyIdentification/cbc:ID">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-013'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ReceiverParty/cac:PartyIdentification/cbc:ID"/>
					<xsl:if test="cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID">
						[<xsl:value-of select="cac:ReceiverParty/cac:PartyIdentification/cbc:ID/@schemeID"/>]
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="cac:ReceiverParty/cac:PostalAddress">
				<b>
				<xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p029'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                </xsl:call-template>
                </b>
				<br/>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cbc:StreetName">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cbc:StreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cbc:AdditionalStreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cbc:CityName">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cbc:CityName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cbc:PostalZone"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cbc:CountrySubentity"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cbc:AddressLine/cbc:Line">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cbc:AddressLine/cbc:Line"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
					<xsl:apply-templates select="cac:ReceiverParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
					</xsl:if>
				</xsl:if>
              <br/>
              <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-014'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ReceiverParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
               <br/>
               <xsl:if test="cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p030a'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID"/>
					<xsl:if test="cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID/@schemeID">
						[<xsl:value-of select="cac:ReceiverParty/cac:PartyLegalEntity/cbc:CompanyID/@schemeID"/>]
					</xsl:if>
					<br/>
				</xsl:if>
				 <xsl:if test="cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p030c'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
                <br/>
				</xsl:if>
					 <xsl:if test="cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p030d'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ReceiverParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode"/>
                <br/>
				</xsl:if>
              </p>
            </div>
            <div class="col-6">
            <!-- Inserting Contractor Customer Party-->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BG-7'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:ContractorCustomerParty"/>
                <br/>
                <xsl:if test="cac:ContractorCustomerParty/cac:Party/cac:Contact">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BG-9'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:call-template name="SellerContact_Order"/>
                </p>
              </xsl:if>
              </p>
            </div>
           </div>
            <div class="row" id="headerrow">
            <div class="col-6">
              <!-- Inserting Provider Party -->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir19-ProviderParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-009'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ProviderParty/cbc:EndpointID"/>
					<xsl:if test="cac:ProviderParty/cbc:EndpointID/@schemeID">
						[<xsl:value-of select="cac:ProviderParty/cbc:EndpointID/@schemeID"/>]
					</xsl:if>
				<br/>  
				<xsl:if test="cac:ProviderParty/cac:PartyIdentification/cbc:ID">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-010'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ProviderParty/cac:PartyIdentification/cbc:ID"/>
					<xsl:if test="cac:ProviderParty/cac:PartyIdentification/cbc:ID/@schemeID">
						[<xsl:value-of select="cac:ProviderParty/cac:PartyIdentification/cbc:ID/@schemeID"/>]
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="cac:ProviderParty/cac:PostalAddress">
				<b>
				<xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p031'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                </xsl:call-template>
                </b>
				<br/>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cbc:StreetName">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cbc:StreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cbc:AdditionalStreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cbc:CityName">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cbc:CityName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cbc:PostalZone">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cbc:PostalZone"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cbc:CountrySubentity"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cbc:AddressLine/cbc:Line">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cbc:AddressLine/cbc:Line"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
					<xsl:apply-templates select="cac:ProviderParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
					</xsl:if>
				</xsl:if>
              <br/>
              <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-011'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ProviderParty/cac:PartyLegalEntity/cbc:RegistrationName"/>
               <br/>
               <xsl:if test="cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p028a'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID"/>
					<xsl:if test="cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID/@schemeID">
						[<xsl:value-of select="cac:ProviderParty/cac:PartyLegalEntity/cbc:CompanyID/@schemeID"/>]
					</xsl:if>
					<br/>
				</xsl:if>
				 <xsl:if test="cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p028c'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
                <br/>
				</xsl:if>
					 <xsl:if test="cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-p028d'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:ProviderParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode"/>
                <br/>
				</xsl:if>
              </p>
            </div>
            <div class="col-6">
            <!--Inserting Seller Supplier Party-->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BG-4'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:SellerSupplierParty"/>
                <br/>
                <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BG-9'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:call-template name="SellerContact_Order"/>
                </p>
              </xsl:if>
              </p>
            </div>
          </div>
      
          <!--Start CatalogueLine-->
          <div class="row" id="tablerow">
            <div class="col-12">
              <table>
                <tr class="UBLCatalogueLineHeader">
                <th align="left" valign="top" width="5%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-032'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-091'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-092'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                   <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-078'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="55%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-catalogueline'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th valign="top" align="right" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir19-051'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                </tr>
                <xsl:apply-templates select="cac:CatalogueLine" mode="catalogue"/>
              </table>
            </div>
          </div>
          <!--End Catalogueline-->
    
          <!-- Start on technical stylesheet footer - for all transactions -->
          <div class="row" id="tablerow">
            <div class="col-12">
              <p>
                <small>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-34'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:apply-templates select="cac:SellerSupplierParty/cac:Party/cbc:EndpointID"/>
                  <xsl:if test="cac:SellerSupplierParty/cac:Party/cbc:EndpointID/@schemeID">
											[<xsl:value-of select="cac:SellerSupplierParty/cac:Party/cbc:EndpointID/@schemeID"/>]
										</xsl:if>
                  <br/>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-49'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:apply-templates select="cac:ContractorCustomerParty/cac:Party/cbc:EndpointID"/>
                  <xsl:if test="cac:ContractorCustomerParty/cac:Party/cbc:EndpointID/@schemeID">
										[<xsl:value-of select="cac:ContractorCustomerParty/cac:Party/cbc:EndpointID/@schemeID"/>]
										</xsl:if>
                  <br/> 
                  <xsl:value-of select="cbc:UBLVersionID"/>
                  <br/>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-23'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:value-of select="cbc:ProfileID"/>
                  <br/>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-24'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:value-of select="cbc:CustomizationID"/>
                  <xsl:if test="cbc:UUID">
                    <xsl:value-of select="cbc:UUID"/>
                    <br/>
                  </xsl:if>
                  <br/>
                  <br/>This Order visualization is generated from SFTI BIS Catalogue 3 XSL Stylesheet Version 1.0<br/>
                </small>
              </p>
            </div>
          </div>
          <!-- End of technical stylesheet footer-->
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
