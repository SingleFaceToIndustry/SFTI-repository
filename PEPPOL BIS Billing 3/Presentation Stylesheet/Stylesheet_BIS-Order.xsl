<?xml version="1.0" encoding="UTF-8"?>
<!--
******************************************************************************************************************

		title= Peppol BIS Ordering, Order Transaction - Reference stylesheet
		Version of this reference stylesheet: 1.0 
		publisher= SFTI
		conformsTo= UBL-Order-2.1.xsd 

		The assumption is that is that the stylesheet is applied to messages that are formally correct, i.e. 
		messages that comply with XML schema and schematron rules. However, as this reference stylesheet is 
		likely to be used also in test environments, some basic validation features have been included, 
		and any consequential errors are displayed as needed."
		
		Derived from work by SFTI tekniska kansli, Sweden
		
******************************************************************************************************************
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Order-2" xmlns:cdl="http://docs.oasis-open.org/codelist/ns/genericode/1.0/" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:sdt="urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="n1 cdl cac cbc ccts sdt udt">
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
  <xsl:template match="n1:Order">
    <!-- Start HTML -->
    <html>
      <xsl:call-template name="doc-head"/>
      <head>
        <link rel="Stylesheet" type="text/css" href="PEPPOL.css"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <title>PEPPOL BIS 3 Order</title>
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
                      <xsl:with-param name="BT-ID" select="'tir01-004'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Order Date -->
                  <xsl:value-of select="cbc:IssueDate"/>&#160;<xsl:value-of select="cbc:IssueTime"/>
                  <br/>
                </p>
                <xsl:if test="cac:ValidityPeriod/cbc:EndDate">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir01-009'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cac:ValidityPeriod/cbc:EndDate"/>
                    <br/>
                  </p>
                </xsl:if>
              </div>
              <!--Start of order Header Information:-->
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-003'"/>
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
                      <xsl:with-param name="BT-ID" select="'tir01-p001'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Sales Order reference number  -->
                  <xsl:value-of select="cbc:SalesOrderID"/>
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
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-118'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Total Payable amount  -->
                  <xsl:call-template name="Currency">
                    <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:PayableAmount"/>
                  </xsl:call-template>&#160;<xsl:value-of select="cbc:DocumentCurrencyCode"/>
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
                <xsl:if test="cac:BuyerCustomerParty/cac:Party/cac:Contact or cbc:AccountingCost">
                  <!-- Inserting Contact information-->
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BG-9'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <xsl:call-template name="OrderBuyerContact"/>
                </xsl:if>
                <xsl:if test="cbc:AccountingCost">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BT-19'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:value-of select="cbc:AccountingCost"/>
                </xsl:if>
     <xsl:if test="cac:PaymentTerms">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'Order_TermsOfPayment'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br />
                  <xsl:apply-templates select="cac:PaymentTerms/cbc:Note"/>
                  <br />
                                               
                </p>
              </xsl:if>                      
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
            
              <xsl:if test="cac:DeliveryTerms">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'Order_TermsOfDelivery'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br />
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-107'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  
                  <xsl:apply-templates select="cac:DeliveryTerms/cbc:ID"/>
                  <br />
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-108'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                 
                  <xsl:apply-templates select="cac:DeliveryTerms/cbc:SpecialTerms"/>
                  <br />  
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-109'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>

                  <xsl:apply-templates select="cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID"/>
                  <br />                                    
                </p>
              </xsl:if>

              
              
            </div>
            <!--Start of Delivery Row-->
          </div>
          <div class="row" id="headerrow">
            <div class="col-3">
              <xsl:apply-templates select="cac:Delivery" mode="DocumentHeader"/>
              <xsl:if test="cac:Delivery/cac:RequestedDeliveryPeriod">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'Order_RequestedDeliveryPeriod'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:if test="cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartDate">
                    <p>
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'tir01-099'"/>
                          <xsl:with-param name="Colon-Suffix" select="'true'"/>
                        </xsl:call-template>
                      </b>
                      <xsl:apply-templates select="cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartDate"/>
                    </p>
                  </xsl:if>
                  <xsl:if test="cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndDate">
                    <p>
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'tir01-100'"/>
                          <xsl:with-param name="Colon-Suffix" select="'true'"/>
                        </xsl:call-template>
                      </b>
                      <xsl:apply-templates select="cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndDate"/>
                    </p>
                  </xsl:if>
                </p>
              </xsl:if>
            </div>
            <div class="col-3">
              <xsl:if test="cac:Delivery/cac:DeliveryParty">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'Order_DeliveryParty'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <xsl:call-template name="DeliveryParty"/>
                </p>
              </xsl:if>
              <xsl:if test="cac:OriginatorCustomerParty">
                <!-- Inserting Originator Party -->
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'Order_OriginatorInformation'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <xsl:call-template name="OriginatorParty"/>
                </p>
              </xsl:if>
            </div>
            <div class="col-6">
              <p>
                <xsl:if test="cac:AdditionalDocumentReference">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BG-24'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <xsl:apply-templates select="cac:AdditionalDocumentReference" mode="Supporting"/>
                </xsl:if>
                <xsl:if test="cac:QuotationDocumentReference">
                  <br/>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-010'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:value-of select="cac:QuotationDocumentReference/cbc:ID"/>
                </xsl:if>
                <xsl:if test="cac:OriginatorDocumentReference">
                  <br/>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-012'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:value-of select="cac:OriginatorDocumentReference/cbc:ID"/>
                </xsl:if>
                <xsl:if test="cac:OrderDocumentReference">
                  <br/>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-011'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:value-of select="cac:OrderDocumentReference/cbc:ID"/>
                </xsl:if>
                <xsl:if test="cac:Contract">
                  <br/>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-019'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                  <xsl:value-of select="cac:Contract/cbc:ID"/>
                </xsl:if>                
                
              </p>
            </div>
          </div>
          <!--Start OrderLine-->
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
                  <th align="left" valign="top" width="5%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-126'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-155'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="35%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'Order_Item'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th valign="top" align="left" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-129'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-146'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-151'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BG-28'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BG-27'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="right" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-131'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                </tr>
                <xsl:apply-templates select="cac:OrderLine/cac:LineItem" mode="order"/>
              </table>
            </div>
          </div>
          <!--End orderline-->
          <!-- Start sum of Order line net amount: -->
          <div class="row" id="sum">
            <div class="col-6">
              <p align="left">
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir01-115'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                </b>
              </p>
            </div>
            <div class="col-6">
              <p align="right">
                <b>
                  <xsl:call-template name="Currency">
                    <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:LineExtensionAmount"/>
                  </xsl:call-template>&#160;<xsl:apply-templates select="cac:AnticipatedMonetaryTotal/cbc:LineExtensionAmount/@currencyID"/>
                </b>
              </p>
            </div>
          </div>
          <!-- End Sum of order line net amount -->
          <!-- Start Allowances and charges on document level: -->
          <!--Start Document allowances-->
          <xsl:if test="cac:AllowanceCharge[cbc:ChargeIndicator ='false']">
            <div class="row" id="tablerow">
              <div class="col-12">
                <h3>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BG-20'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </h3>
                <table>
                  <tr>
                    <th align="left" valign="top" colspan="2" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-105'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th align="left" valign="top" colspan="2" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-104'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th align="left" valign="top" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-102'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th align="right" valign="top" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-93'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th valign="top" align="right" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-92'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                  </tr>
                  <xsl:for-each select="cac:AllowanceCharge">
                    <xsl:if test="cbc:ChargeIndicator ='false'">
                      <xsl:call-template name="Allowance"/>
                    </xsl:if>
                  </xsl:for-each>
                </table>
              </div>
            </div>
          </xsl:if>
          <!--End Document allowances-->
          <!-- Start AllowanceTotal Amount: -->
          <xsl:if test="cac:AnticipatedMonetaryTotal/cbc:AllowanceTotalAmount">
            <div class="row" id="sum">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BT-107'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <b>
                    <xsl:call-template name="Currency">
                      <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:AllowanceTotalAmount"/>
                    </xsl:call-template>&#160;<xsl:apply-templates select="cac:AnticipatedMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID"/>
                  </b>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End AllowanceTotal Amount -->
          <!--Start Document Charges-->
          <xsl:if test="cac:AllowanceCharge[cbc:ChargeIndicator ='true']">
            <div class="row" id="tablerow">
              <div class="col-12">
                <h3>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BG-21'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </h3>
                <table>
                  <tr>
                    <th align="left" valign="top" colspan="2" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-98'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th align="left" valign="top" colspan="2" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-97'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th align="left" valign="top" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-95'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th align="right" valign="top" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-100'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                    <th valign="top" align="right" width="20%">
                      <b>
                        <xsl:call-template name="LabelName">
                          <xsl:with-param name="BT-ID" select="'BT-99'"/>
                          <xsl:with-param name="Colon-Suffix" select="'false'"/>
                        </xsl:call-template>
                      </b>
                    </th>
                  </tr>
                  <xsl:for-each select="cac:AllowanceCharge">
                    <xsl:if test="cbc:ChargeIndicator ='true'">
                      <xsl:call-template name="Charge"/>
                    </xsl:if>
                  </xsl:for-each>
                </table>
              </div>
            </div>
          </xsl:if>
          <!--End Document Charges-->
          <!-- Start ChargeTotal Amount: -->
          <xsl:if test="cac:AnticipatedMonetaryTotal/cbc:ChargeTotalAmount">
            <div class="row" id="sum">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BT-108'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <b>
                    <xsl:call-template name="Currency">
                      <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:ChargeTotalAmount"/>
                    </xsl:call-template>&#160;<xsl:apply-templates select="cac:AnticipatedMonetaryTotal/cbc:ChargeTotalAmount/@currencyID"/>
                  </b>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End ChargeTotal Amount -->
          <!-- Start Tax Amount: -->
          <xsl:if test="cac:TaxTotal/cbc:TaxAmount">
            <div class="row" id="headerrow">
              <div class="col-6">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-114'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <xsl:call-template name="Currency">
                    <xsl:with-param name="currencyvalue" select="cac:TaxTotal/cbc:TaxAmount"/>
                  </xsl:call-template>&#160;<xsl:apply-templates select="cac:TaxTotal/cbc:TaxAmount/@currencyID"/>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End Tax Amount -->
          <!-- Start TaxExclusive Amount: -->
          <xsl:if test="cac:AnticipatedMonetaryTotal/cbc:TaxExclusiveAmount">
            <div class="row" id="headerrow">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-145'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <xsl:call-template name="Currency">
                    <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:TaxExclusiveAmount"/>
                  </xsl:call-template>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End TaxExclusive Amount -->
          <!-- Start TaxInclusive Amount: -->
          <xsl:if test="cac:AnticipatedMonetaryTotal/cbc:TaxInclusiveAmount">
            <div class="row" id="headerrow">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir01-147'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <b>
                    <xsl:call-template name="Currency">
                      <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:TaxInclusiveAmount"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End TaxInclusive Amount -->
          <!-- Start Prepaid Amount: -->
          <xsl:if test="cac:AnticipatedMonetaryTotal/cbc:PrepaidAmount">
            <div class="row" id="headerrow">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BT-113'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <xsl:call-template name="Currency">
                    <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:PrepaidAmount"/>
                  </xsl:call-template>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End Prepaid Amount -->
          <!-- Start Rounding Amount: -->
          <xsl:if test="cac:AnticipatedMonetaryTotal/cbc:PayableRoundingAmount">
            <div class="row" id="headerrow">
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'BT-114'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                    </xsl:call-template>
                  </b>
                </p>
              </div>
              <div class="col-6">
                <p align="right">
                  <xsl:call-template name="Currency">
                    <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:PayableRoundingAmount"/>
                  </xsl:call-template>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- End Rounding Amount -->
          <!-- Start Payable Amount: -->
          <div class="row" id="headerrow">
            <div class="col-6">
              <h2 align="left">
                <xsl:call-template name="LabelName">
                  <xsl:with-param name="BT-ID" select="'tir01-118'"/>
                  <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
              </h2>
            </div>
            <div class="col-6">
              <h2 align="right">
                <xsl:call-template name="Currency">
                  <xsl:with-param name="currencyvalue" select="cac:AnticipatedMonetaryTotal/cbc:PayableAmount"/>
                </xsl:call-template>&#160;<xsl:apply-templates select="cac:AnticipatedMonetaryTotal/cbc:PayableAmount/@currencyID"/>
              </h2>
            </div>
          </div>
          <!-- End Payable Amount -->
          <!-- Start document totals: -->
          <!-- Start on PAYMENT TERMS information -->
          <xsl:if test="cac:PaymentTerm">
            <div class="row" id="tablerow">
              <div class="col-12">
                <h3>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-20'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                </h3>
                <p>
                  <xsl:apply-templates select="cac:PaymentTerms"/>
                </p>
              </div>
            </div>
          </xsl:if>
          <!-- Seller Row starts here-->
          <div class="row" id="footer">
            <div class="col-4">
              <!-- Inserting Accounting Supplier Party-->
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
            <div class="col-4">
              <xsl:if test="cac:AccountingCustomerParty">
                <p>
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'Order_InvoiceeParty'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <xsl:apply-templates select="cac:AccountingCustomerParty"/>
                  <xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:Contact">
<br/>                    
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'Order_InvoiceeContactInfo'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cac:Contact" mode="OrderGenericContact"/>
                  </xsl:if>
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
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir01-157'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID"/>
                  <xsl:if test="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID">
										[<xsl:value-of select="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID"/>]
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
                  <br/>This Order visualization is generated from SFTI BIS Order 3 XSL Stylesheet Version 1.0<br/>
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
