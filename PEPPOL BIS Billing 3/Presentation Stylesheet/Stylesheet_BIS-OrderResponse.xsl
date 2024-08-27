<?xml version="1.0" encoding="UTF-8"?>
<!--******************************************************************************************************************

		title= Peppol BIS Ordering, OrderResponse Transaction - Reference stylesheet
		Version of this reference stylesheet: 1.0 
		publisher= SFTI
		conformsTo= UBL-OrderResponse-2.1.xsd 

		The assumption is that is that the stylesheet is applied to messages that are formally correct, i.e. 
		messages that comply with XML schema and schematron rules. However, as this reference stylesheet is 
		likely to be used also in test environments, some basic validation features have been included, 
		and any consequential errors are displayed as needed."
		
		Derived from work by SFTI tekniska kansli, Sweden
		
******************************************************************************************************************-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" xmlns:cdl="http://docs.oasis-open.org/codelist/ns/genericode/1.0/" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:sdt="urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="n1 cdl cac cbc ccts sdt udt">
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
  <xsl:template match="n1:OrderResponse">
    <!-- Start HTML -->
    <html>
      <xsl:call-template name="doc-head"/>
      <head>
        <link rel="Stylesheet" type="text/css" href="PEPPOL.css"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <title>PEPPOL BIS 3 OrderResponse</title>
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
                <xsl:call-template name="OrderResponseCode">
                  <xsl:with-param name="Code" select="cbc:OrderResponseCode"/>
                </xsl:call-template>
              </h3>
              <h1>
                <xsl:choose>
                  <xsl:when test="cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name">
                    <xsl:value-of select="cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
                  </xsl:otherwise>
                </xsl:choose>
              </h1>
            </div>
            <div class="col-6" id="header">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir76-004'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Order Date -->
                  <xsl:value-of select="cbc:IssueDate"/>&#160;<xsl:value-of select="cbc:IssueTime"/>
                  <br/>
                </p>
              </div>
              <!--Start of order Header Information:-->
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir76-003'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <!-- Inserting Order ID -->
                  <br/>
                  <xsl:value-of select="cbc:ID"/>
                  <br/>
                </p>
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-011'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting initail Order reference number  -->
                  <xsl:value-of select="cac:OrderReference/cbc:ID"/>
                  <br/>
                </p>
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-p002'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Customer Reference::  -->
                  <xsl:value-of select="cbc:CustomerReference"/>
                  <br/>
                </p>
              </div>
            </div>
            <!--End of Order Header Information-->
          </div>
          <div class="row" id="headerrow">
            <div class="col-3">
              <!-- Inserting Buyer Customer Party -->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BG-7'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:BuyerCustomerParty"/>
              </p>
            </div>
            <div class="col-3">
              <p>
              </p>
            </div>
            <div class="col-6">
              <xsl:if test="cbc:Note">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-006'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <xsl:apply-templates select="cbc:Note"/>
                </p>
              </xsl:if>
            </div>
            <!--Start of Delivery Row-->
          </div>
          <div class="row" id="headerrow">
            <div class="col-3">
              <xsl:apply-templates select="cac:Delivery" mode="DocumentHeader"/>
              <xsl:if test="cac:Delivery/cac:PromisedDeliveryPeriod">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'OrderResponse_DeliveryPeriod'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:if test="cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate">
                    <p>
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'tir01-099'"/>
                          <xsl:with-param name="Colon-Suffix" select="'true'"/>
                        </xsl:call-template>
                      </b>
                      <xsl:apply-templates select="cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate"/>
                    </p>
                  </xsl:if>
                  <xsl:if test="cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate">
                    <p>
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'tir01-100'"/>
                          <xsl:with-param name="Colon-Suffix" select="'true'"/>
                        </xsl:call-template>
                      </b>
                      <xsl:apply-templates select="cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate"/>
                    </p>
                  </xsl:if>
                </p>
              </xsl:if>
            </div>
            <div class="col-3">
            </div>
            <div class="col-6">
              <xsl:if test="cbc:SalesOrderID">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-p001'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:value-of select="cbc:SalesOrderID"/>
                </p>
              </xsl:if>
            </div>
          </div>
          <!--Start OrderResponseLine-->
          <div class="col-12">
            <br/>
            <h3>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'Order_OrderLine'"/>
                <xsl:with-param name="Colon-Suffix" select="'false'"/>
              </xsl:call-template>
            </h3>
          </div>
          <div class="row" id="tablerow">
            <div class="col-12">
              <table>
                <tr class="UBLOrderLineHeader">
                  <th align="left" valign="top" width="10%">
                    <b><!-- ID -->
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-126'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b><!-- Response -->
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir76-204'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                    <!-- Quantity -->
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir76-132'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="30%">
                    <b>
                    <!-- Item-->
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'Order_Item'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                    <!-- Price -->
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-146'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="30%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'OrderResponse_Substituted'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                </tr>
                <xsl:apply-templates select="cac:OrderLine/cac:LineItem" mode="orderresponse"/>
              </table>
            </div>
          </div>
          <!--End orderline-->
          <div class="row" id="footer">
            <div class="col-4">
              <!-- Inserting Seller Supplier Party-->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BG-4'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:SellerSupplierParty"/>
              </p>
            </div>
            <div class="col-4">
              <!-- Inserting contact information -->
              <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BG-6'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:call-template name="SellerContact_Order"/>
                </p>
              </xsl:if>
            </div>
          </div>
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
                  <xsl:apply-templates select="cac:BuyerCustomerParty/cac:Party/cbc:EndpointID"/>
                  <xsl:if test="cac:BuyerCustomerParty/cac:Party/cbc:EndpointID/@schemeID">
										[<xsl:value-of select="cac:BuyerCustomerParty/cac:Party/cbc:EndpointID/@schemeID"/>]
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
                  <br/>This OrderResponse visualization is generated from SFTI BIS Order 3 XSL Stylesheet Version 1.0<br/>
                  
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
