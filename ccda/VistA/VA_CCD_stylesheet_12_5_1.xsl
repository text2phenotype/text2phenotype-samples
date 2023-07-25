<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n3="http://www.w3.org/1999/xhtml"
	xmlns:n1="urn:hl7-org:v3"
	xmlns:n2="urn:hl7-org:v3/meta/voc"
	xmlns:voc="urn:hl7-org:v3/voc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    
	<xsl:output method="html" indent="yes" version="1.0" omit-xml-declaration="no"
		encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system=""/>

	<xsl:template name="displaySource"><head>
    <style>
	
    body {
}
table.first {
	text-align: left;
	vertical-align: top;
	background-color: #ffffff;
	border-right: 0px solid #002452; 
	border-top: 2px solid #000000;
	border-left: 0px solid #002452;
	border-bottom: 2px solid #000000;
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	font: 95% Times;
	font-size:11pt; 
}

table.firstSub {
	text-align: left;
	vertical-align: top;
	background-color: #ffffff;
	border-right: 0px; 
	border-top: 0px;
	border-left: 0px;
	border-bottom: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	font: 95% Times;
	font-size:11pt; 
}

table.second {
	text-align: left;
	vertical-align: top;
	background-color: #ffffff;
	border-right: 3px solid #000000; 
	border-top: 0px solid #002452;
	border-left: 3px solid #000000;
	border-bottom: 3px solid #002452;
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	font: 95% Times;
	font-size:10pt; 
}

table.fourth {
	text-align: left;
	vertical-align: top;
	background-color: #CCCCff;
	border-right: 3px solid #002452; 
	border-top: 0px solid #002452;
	border-left: 3px solid #002452;
	border-bottom: 3px solid #002452;
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	font: 95% Times;
	font-size:10pt;
	border-collapse: collapse 
}

table.comments{
    border:0;
    font: 100% Microsoft sans serif;
    font-size:10pt;
    vertical-align:middle;
    margin:0 0 0 0;
}

th.first {
	text-align: left;
	vertical-align: top;
	color: black;
	background-color: #ffffff;
	font: bold 95% Times;
	padding-left: 3px;
	padding-right: 3px; 
}


tr.first {
	text-align: left;
	vertical-align: top;
	color: black;
	background-color: #FFFFFF;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 9px;
	padding-right: 3px; 
}

td.first  {
	padding-left: 3px;
	padding-right: 3px;
	padding-top: 2px;
	padding-bottom: 3px;
	color: white;
	background-color: #002452;
}

tr.fourth {
	text-align: left;
	vertical-align: top;
	color: black;
	background-color: #F9F4EF;
	background-color: #CCCCff;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 9px;
	padding-right: 3px;
	font-size:10pt;
}

tr.second {
	text-align: left;
	vertical-align: top;
	color: black;
	background-color: #FFFFFF;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 9px;
	padding-right: 3px;
	font-size:10pt;
}

tr.third {
	text-align: left;
	vertical-align: top;
	color: black;
	background-color: #FFFFFF;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 9px;
	padding-right: 3px;
	font-size:10pt;
}
td.tdWrap {
	word-wrap:break-word;	
}
.break { page-break-before: always; }
@page land { size:landscape; }
@page port { size:portrait; }
.portraitPage { page:port; }
.landscapePage { page:land; width: 29.7cm; }
</style>
    	
        
    <h2 align="center">
				<xsl:call-template name="documentTitle">
					<xsl:with-param name="root" select="."/>
				</xsl:call-template>
			</h2>
		</head>
	</xsl:template>
    

	<xsl:template name="displayTitle">
    
		<div style="text-align:center;width:85%">
			<span style="font-size:larger;font-weight:bold">
				Department of Veterans Affairs <xsl:value-of select="n1:code/@displayName"/><br/>
                <xsl:text>VA Continuity of Care Document (VA CCD)</xsl:text><br/>
			</span>
		</div>
	</xsl:template>

	<xsl:template name="displayReportDates">
		<div style="text-align:center;width:85%">
		<b>
			<xsl:text>Created On: </xsl:text>
		</b>
		<xsl:call-template name="getCreatedOnDate"/>
		<xsl:if test="n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:low/@value">
			<xsl:text disable-output-escaping="yes">                </xsl:text>
			<b>
				<xsl:text>Date Range: </xsl:text>
			</b>
			<xsl:choose>
				<xsl:when test="string-length(n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:low/@value)=0">
					<xsl:call-template name="na"/>
				</xsl:when>
				<xsl:when test="starts-with(n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:low/@value,' ')">
					<xsl:call-template name="na"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:low/@value"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<b>
				<xsl:text disable-output-escaping="yes"> - </xsl:text>
			</b>
			<xsl:choose>
				<xsl:when test="string-length(n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:high/@value)=0">
					<xsl:call-template name="na"/>
				</xsl:when>
				<xsl:when test="starts-with(n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:high/@value,' ')">
					<xsl:call-template name="na"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="n1:documentationOf/n1:serviceEvent/n1:performer/n1:effectiveTime/n1:high/@value"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<br/>
		</div>
	</xsl:template>
    

	<xsl:template name="displayPatientBlock">
		<table width='100%' class="first">
			<xsl:variable name="patientRole" select="n1:recordTarget/n1:patientRole"/>
			<tr>
				<td width='15%' valign="top">
					<b>
						<xsl:text>Patient: </xsl:text>
					</b>
				</td>
				<td width='35%' valign="top">
					<xsl:call-template name="getName">
						<xsl:with-param name="name" select="$patientRole/n1:patient/n1:name"/>
					</xsl:call-template>
					<xsl:if test="$patientRole/n1:addr">
						<xsl:call-template name="getAddress">
							<xsl:with-param name="addr" select="$patientRole/n1:addr"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="$patientRole/n1:telecom/@value">
							<xsl:for-each select="$patientRole/n1:telecom">
								<xsl:call-template name="getTelecom">
									<xsl:with-param name="telecom" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<br/>
							<b>
								<xsl:text>tel: PATIENT PHONE MISSING</xsl:text>
							</b>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td width='20%' align='left' valign="top">
					<b>
						<xsl:text>Medical Record Number: </xsl:text>
					</b>
				</td>
				<td width='30%' valign='top' align='left'>
					<xsl:if test="string-length($patientRole/n1:id/@extension)>0">
						<xsl:value-of select="$patientRole/n1:id/@extension"/>
					</xsl:if>
				</td>
			</tr>

			<tr>
				<td width='15%' valign="top">
					<b>
						<xsl:text>Birthdate: </xsl:text>
					</b>
				</td>
				<td width='35%' valign="top">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$patientRole/n1:patient/n1:birthTime/@value"/>
					</xsl:call-template>
				</td>
				<td align='left' valign="top" colspan="2" width="50%" cellpadding="0" >
                	<table width="100%" class="firstSub">
                    <tr>
                    <td align='left' valign="top" width="30%">
					<b>
						Next of Kin:
					</b>
                    </td>
                    <td width='70%' valign="top" align="left"><xsl:call-template name="getParticipant">
                            <xsl:with-param name="participant"
                                select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='NOK']" />
                        </xsl:call-template>
                    </td>
                    </tr>
                    </table>
                    </td>
			</tr>
            <tr>
				<td width='15%' valign="top">
					<b>
						<xsl:text>Gender: </xsl:text>
					</b>
				</td>
				<td width='35%' valign="top">
					<xsl:call-template name="getGenderString"/>
				</td>
				<td align='left' valign="top" colspan="2" width="50%" rowspan="2">
                	<table width="100%" class="firstSub" >
                    <tr>
                    <td align='left' valign="top" width="30%">
					<b><xsl:text>Emergency Contact: </xsl:text></b>
                    </td>
                    <td width='70%' valign="top" align="left">
                        <xsl:call-template name="getParticipant">
                            <xsl:with-param name="participant"
                                select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='ECON']" />
                        </xsl:call-template>
                    </td>
                    </tr>
                    </table>
            	</td>	
			</tr>
			<xsl:variable name="hasLanguages">
				<xsl:call-template name="isLanguageFound">
					<xsl:with-param name="patientRole" select="$patientRole"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:if test="$hasLanguages">
				<tr>
					<td width="15%" valign="top">
						<b>
							<xsl:text>Language(s):</xsl:text>
						</b>
					</td>
					<td width="35%" valign="top">
					<xsl:call-template name="displayLanguages">
						<xsl:with-param name="patientRole" select="$patientRole"/>
					</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td width='15%' valign="top">
				</td>
				<td width='35%' valign="top">
				</td>
				<td align='left' valign="top" colspan="2" width="50%">
                </td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="n1:languageCode">
		<xsl:variable name="codeString">
			<xsl:apply-templates select="." mode="data"/>
		</xsl:variable>
		<xsl:if test="string-length(normalize-space($codeString))>0">
			
				<xsl:value-of select="$codeString"/>
			
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="displayAuthorBlock">
		<xsl:if test="n1:author">
			<table width="100%" class="first">
				<tr>
					<td width="15%">
						<b>Source:</b>
					</td>
					<td width="85%">
						<xsl:value-of select="n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name/text()"/>
					</td>
				</tr>
				<xsl:choose>
					<xsl:when test="not($isMVA)">
						<xsl:if test="string-length(normalize-space(n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name))>1">
							<tr>
							<td width="15%" valign="top"></td>
							<td width="85%" valign="top">
								Author:
								<xsl:call-template name="getPersonNameFromRoot">
									<xsl:with-param name="nameRoot" select="n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
								</xsl:call-template>
							</td>
							</tr>
						</xsl:if>
					</xsl:when>
				</xsl:choose>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="displayTableOfContents">
		<div style="margin-bottom:35px">
			<h3>
				<a name="toc">Table of Contents</a>
			</h3>
			<ul>
				<xsl:for-each select="n1:component/n1:structuredBody/n1:component/n1:section/n1:title">
					<xsl:sort/>
					<xsl:variable name="compFound">
						<xsl:call-template name="componentFound">
							<xsl:with-param name="compSection" select="../."/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($compFound)>0">
							<li>
								<a style="font-family:georgia;font-size:12pt"  href="#{generate-id(.)}">
									<xsl:value-of select="."/>
								</a>
							</li>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>

	<xsl:template name="displayContents">
		<table class="break"></table>
		<xsl:apply-templates select="n1:component/n1:structuredBody/n1:component">
			<xsl:sort select="n1:section/n1:title"/>
		</xsl:apply-templates>
		<br />
	</xsl:template>

	<xsl:template name="displayContactInfoBlock">
		<xsl:choose>
			<xsl:when test="string-length(n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='NOK'])>0">
				<table class="first">
					<tr>
						<td width="100px" valign="top" align='left'>
							<b>Emergency Contact: </b>
						</td>
						<td valign="top">
							<xsl:call-template name="getParticipant">
								<xsl:with-param name="participant" select="n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='NOK']"/>
							</xsl:call-template>
						</td>
						<td width="50px"> </td>
					</tr>
				</table>
			</xsl:when>
			<xsl:when test="string-length(n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='ECON'])>0">
				<table class="first">
					<tr>
						<td width="100px" valign="top" align='left'>
							<b>Emergency Contact: </b>
						</td>
						<td valign="top">
							<xsl:call-template name="getParticipant">
								<xsl:with-param name="participant" select="n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='ECON']"/>
							</xsl:call-template>
						</td>
						<td width="50px"> </td>
					</tr>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">  </xsl:text>
				<span style="font-weight:bold; border:2px solid;">
					<xsl:text> EMERGENCY CONTACT INFO MISSING! </xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
    
    <xsl:template name="displayEmergencyContactBlock">
		<xsl:choose>
			<xsl:when test="string-length(n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='ECON'])>0">
				<table width="100%" class="firstSub" >
                    <tr>
                        <td align='left' valign="top" width="30%">
                        <b><xsl:text>Emergency Contact: </xsl:text></b>
                        </td>
                        <td width='70%' valign="top" align="left">
                            <xsl:call-template name="getParticipant">
                                <xsl:with-param name="participant"
                                    select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='ECON']" />
                            </xsl:call-template>
                        </td>
                    </tr>
                </table>
			</xsl:when>
            <xsl:when test="string-length(n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='NOK'])>0">
				<table width="100%" class="firstSub" >
                    <tr>
                        <td align='left' valign="top" width="30%">
                        <b><xsl:text>Emergency Contact: </xsl:text></b>
                        </td>
                        <td width='70%' valign="top" align="left">
                            <xsl:call-template name="getParticipant">
                                <xsl:with-param name="participant" select="n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='NOK']"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                </table>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">  </xsl:text>
				<span style="font-weight:bold; border:2px solid;">
					<xsl:text> EMERGENCY CONTACT INFO MISSING! </xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getParticipant">
		<xsl:param name="participant"/>
		<table border="0"><tr><td class="tdWrap" width="75"><div style="width:250px"><xsl:call-template name="getName">
				<xsl:with-param name="name" select="$participant/n1:associatedPerson/n1:name"/>
			</xsl:call-template>
			<xsl:if test="$participant/n1:addr">
				<xsl:choose>
					<xsl:when test="$isKaiser">
						<xsl:call-template name="getSingleAddress">
							<xsl:with-param name="addr" select="$participant/n1:addr"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="getAddress">
							<xsl:with-param name="addr" select="$participant/n1:addr"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$participant/n1:telecom/@value">
					<xsl:for-each select="$participant/n1:telecom">
						<xsl:call-template name="getTelecom">
							<xsl:with-param name="telecom" select="."/>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<br/>
						<xsl:text>tel: CONTACT PHONE MISSING</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="$participant/n1:code/n1:originalText">
				<br/>
				<b>Relationship: </b>
				<xsl:value-of select="$participant/n1:code/n1:originalText"/>
			</xsl:if></div></td></tr></table>
	</xsl:template>

	<xsl:template name="getSingleAddress">
		<xsl:param name="addr"/>
		<xsl:if test="$addr/n1:streetAddressLine != ' '">
			<br/>
			<xsl:if test="string-length($addr/n1:streetAddressLine)>0">
				<xsl:value-of select="$addr/n1:streetAddressLine"/>
			</xsl:if>

			<br/>
			<xsl:value-of select="$addr/n1:city"/>,
			<xsl:value-of select="$addr/n1:state"/>,
			<xsl:value-of select="$addr/n1:postalCode"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getAddress">
		<xsl:param name="addr"/>
		<xsl:if test="$addr/n1:streetAddressLine != ' '">
			<xsl:for-each select="$addr/n1:streetAddressLine">
				<br/>
				<xsl:if test="string-length($addr/n1:streetAddressLine)>0">
					<xsl:value-of select="."/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<br/>
		<xsl:value-of select="$addr/n1:city"/>,
		<xsl:value-of select="$addr/n1:state"/>,
		<xsl:value-of select="$addr/n1:postalCode"/>
	</xsl:template>

	<xsl:template name="getTelecom">
		<xsl:param name="telecom"/>
		<br/>
		<xsl:if test="string-length($telecom/@value)>0">
			<xsl:value-of select="$telecom/@value"/>
			<xsl:choose>
				<xsl:when test="./@use='HP' ">
					<b>
						<xsl:text> Home</xsl:text>
					</b>
				</xsl:when>
				<xsl:when test="./@use='WP' ">
					<b>
						<xsl:text> Work</xsl:text>
					</b>
				</xsl:when>
				<xsl:when test="./@use='HV' ">
					<b>
						<xsl:text> Vacation</xsl:text>
					</b>
				</xsl:when>
				<xsl:when test="./@use='MC' ">
					<b>
						<xsl:text> Mobile</xsl:text>
					</b>
				</xsl:when>
				<xsl:otherwise>
					<b>
						<xsl:text></xsl:text>
					</b>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!-- Get Author  -->
	<xsl:template name="getAuthor">
		<xsl:variable name="author"/>
		<xsl:call-template name="getName">
			<xsl:with-param name="name" select="n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test="$author">
				<xsl:value-of select="n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- StructuredBody -->

	<xsl:template name="displayProblemComponentSection">
		<xsl:call-template name="getCommonFormatComments"/>
		<xsl:call-template name="problemDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayAllergyComponentSection">
		<xsl:call-template name="getCommonFormatComments"/>
		<xsl:call-template name="allergyDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayMedsComponentSection">
		<xsl:call-template name="getCommonFormatComments"/>
		<xsl:call-template name="medDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayEncounterComponentSection">
		<!--<xsl:call-template name="encounterNotice">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>-->
		<xsl:call-template name="encounterDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayResultsComponentSection">
		<xsl:call-template name="getCommonFormatComments"/>
		<xsl:call-template name="resultsDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayProceduresComponentSection">
		<!--<xsl:call-template name="proceduresNotice">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>-->
		<xsl:call-template name="proceduresDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayImmunizationsComponentSection">
		<xsl:call-template name="getCommonFormatComments"/>
		<xsl:call-template name="immunizationsDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayVitalsComponentSection">
		<xsl:call-template name="getCommonFormatComments"/>
		<xsl:call-template name="vitalsDetails">
			<xsl:with-param select="." name="section"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- Encounter Detail Section-->
	<xsl:template name="encounterDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Encounters</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains a list of completed VA Outpatient Encounters for the patient, along with the titles of the associated VA Notes. The data comes from all VA treatment facilities.  It includes the 25 most recent Encounter dates within the last 36 months. There is a limit of 10 Note titles for each Encounter. Follow-up visits related to the VA Encounter are not included.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Date/Time</xsl:text>
						<xsl:if test="n1:entry/n1:encounter">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:encounter)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<th class="first">Encounter Type</th>
					<th class="first">Encounter Comments</th>
					<th class="first">Provider</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="$section/n1:entry">
					<xsl:sort select="n1:encounter/n1:effectiveTime/n1:low/@value" order="descending"/>
				</xsl:apply-templates>
			</tbody>
		</table>
		<br />
		<xsl:choose>
			<xsl:when test="not(boolean(n1:entry/n1:encounter))">
				<xsl:call-template name="noData"/>
			</xsl:when>
			<xsl:otherwise>
				<br />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Meds Detail Section -->
	<xsl:template name="medDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Medications</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains Prescription and Non-Prescription Medications on record at VA for the patient.   Data comes from all VA treatment facilities.  It shows all medications dispensed within the last 15 months.  The list includes the prescription status as active or non-active.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Medications</xsl:text>
						<xsl:if test="n1:entry/n1:substanceAdministration">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:substanceAdministration)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<!--<th class="first">Route</th>-->
					<!--<th class="first">Interval</th>-->
					<th class="first">Status</th>
					<th class="first">Quantity</th>
					<th class="first">Order Expiration</th>
					<th class="first">Prescription #</th>
					<th class="first">Dispense Date</th>
					<th class="first">Sig (Instructions)</th>
					<th class="first">Provider</th>
					<th class="first">Source</th>
				</tr>
			</thead>
			<tbody>
				<xsl:choose>
					<xsl:when test="$section/n1:entry/n1:substanceAdministration/n1:effectiveTime/n1:high">
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="$section/n1:entry/n1:substanceAdministration/n1:effectiveTime/n1:high/@value"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="$section/n1:entry/n1:substanceAdministration/n1:entryRelationship/n1:supply/n1:effectiveTime/@value"/>
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</tbody>
		</table>
		<br />
		<xsl:choose>
			<xsl:when test="not(boolean(n1:entry/n1:substanceAdministration))">
				<xsl:call-template name="noData"/>
				<br />
			</xsl:when>
			<xsl:otherwise>
				<br />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Problem Detail Section -->
	<xsl:template name="problemDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Problems/Conditions</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains a list of Problems/Conditions known to VA for the patient.  It includes both active and inactive problems/conditions.  The data comes from all VA treatment facilities.  Data is available 3 calendar days after it has been entered by a VA provider.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Problems</xsl:text>
						<xsl:if test="n1:entry/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<th class="first">Status</th>
					<th class="first">Problem Code</th>
					<th class="first">Date of Onset</th>
					<th class="first">Provider</th>
					<th class="first">Source</th>
				</tr>

			</thead>
			<tbody>
				<xsl:choose>
					<xsl:when test="$section/n1:entry/n1:act/n1:entryRelationship/n1:observation/n1:effectiveTime/n1:low">
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="n1:act/n1:entryRelationship/n1:observation/n1:effectiveTime/n1:low/@value" order="descending"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="n1:act/n1:effectiveTime/n1:low/@value" order="descending"/>
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</tbody>
		</table>
		<br />
		<xsl:choose>
			<xsl:when test="not(boolean(n1:entry/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation))">
				<xsl:call-template name="noData"/>
			</xsl:when>
			<xsl:otherwise>
				<br />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Allergy Detail Section -->
	<xsl:template name="allergyDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Allergies</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains Allergies on record with VA for the patient.  The data comes from all VA treatment facilities. It does not list allergies that were removed or entered in error. Some allergies may be reported in the Immunization section.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Allergens</xsl:text>
						<xsl:if test="n1:entry/n1:act/n1:entryRelationship/n1:observation">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:act/n1:entryRelationship/n1:observation)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<th class="first">Verification Date</th>
					<th class="first">Event Type</th>
					<th class="first">Reaction</th>
					<th class="first">Severity</th>
					<th class="first">Source</th>
				</tr>
			</thead>
			<tbody>
				<xsl:choose>
					<xsl:when test="$section/n1:entry/n1:act/n1:entryRelationship/n1:observation/n1:effectiveTime/n1:low">
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="n1:act/n1:entryRelationship/n1:observation/n1:effectiveTime/n1:low/@value" order="descending"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="n1:act/n1:effectiveTime/n1:low/@value" order="descending"/>
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</tbody>
		</table>
		<br />
		<xsl:choose>
			<xsl:when test="not(boolean(n1:entry/n1:act/n1:entryRelationship/n1:observation))">
				<xsl:call-template name="noData"/>
			</xsl:when>
			<xsl:otherwise>
				<br />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- (Lab)Results Detail Section-->
	<xsl:template name="resultsDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Lab Results</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains Chemistry and Hematology Lab Results on record with VA for the patient.  The data comes from all VA treatment facilities.  Results include the last 12 months and are limited to the 5 most recent sets of tests.  Results are available 3 calendar days after they have been verified by a VA provider.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first" width="75px">
						<xsl:text>Date/Time</xsl:text>
						<xsl:choose>
							<xsl:when test="n1:entry/n1:organizer/n1:component/n1:observation and not(boolean(n1:entry/n1:observation))">
								<xsl:text> - Count (</xsl:text>
								<xsl:value-of select="count(n1:entry/n1:organizer/n1:component)"/>
								<xsl:text>)</xsl:text>
							</xsl:when>
							<xsl:when test="n1:entry/n1:organizer/n1:component/n1:observation and n1:entry/n1:observation">
								<xsl:text> - Count (</xsl:text>
								<xsl:value-of select="count(n1:entry/n1:organizer/n1:component)+count(n1:entry/n1:observation)"/>
								<xsl:text>)</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="n1:entry/n1:observation">
									<xsl:text> - Count (</xsl:text>
									<xsl:value-of select="count(n1:entry/n1:observation)"/>
									<xsl:text>)</xsl:text>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</th>
					<th class="first" width="120px">Result Type</th>
					<th class="first" width="75px">Result - Unit</th>
					<th class="first" width="100px">Interpretation</th>
					<th class="first" width="130px">Reference Range</th>
					<th class="first" width="80px">Status</th>
					<th class="first" width="100px">Source</th>
				</tr>
			</thead>
			<tbody>
				<xsl:choose>
					<xsl:when test="n1:observation/n1:effectiveTime/@value">
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="n1:observation/n1:effectiveTime/@value" order="descending"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$section/n1:entry">
							<xsl:sort select="n1:organizer/n1:component/n1:observation/n1:effectiveTime/@value" order="descending"/>
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</tbody>
		</table>
		<br />
		<xsl:choose>
			<xsl:when test="not(boolean(n1:entry/n1:observation)) and not(boolean(n1:entry/n1:organizer/n1:component/n1:observation[@classCode='OBS' and @moodCode='EVN']))">
				<xsl:call-template name="noData"/>
			</xsl:when>
			<xsl:otherwise>
				<br />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Procedures Detail Section-->
	<xsl:template name="proceduresDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Procedures</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains Procedures performed at VA for the patient.  It shows surgical and radiological procedures.   Included are the 25 most recent procedure dates within the last 12 months.  Data comes from all VA treatment facilities.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Date/Time</xsl:text>
						<xsl:if test="n1:entry/n1:procedure">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:procedure)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<th class="first">Procedure Type</th>
					<th class="first">Procedure Comments</th>
					<th class="first">Provider</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="$section/n1:entry">
					<xsl:sort select="n1:procedure/n1:effectiveTime/n1:low/@value" order="descending"/>
				</xsl:apply-templates>
			</tbody>
		</table>
		<br />
		<xsl:choose>
			<xsl:when test="not(boolean(n1:entry/n1:procedure))">
				<xsl:call-template name="noData"/>
			</xsl:when>
			<xsl:otherwise>
				<br />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
    
	<!-- Immunizations Detail Section -->
	<xsl:template name="immunizationsDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Immunizations</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains Immunizations on record with VA for the patient.  The data comes from all VA treatment facilities. A reaction to an immunization may be reported in the allergy section.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Immunizations</xsl:text>
						<xsl:if test="n1:entry/n1:substanceAdministration">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:substanceAdministration)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<th class="first">Series</th>
					<th class="first">Date Issued</th>
					<th class="first">Reaction</th>
					<th class="first">Comments</th>
                    <th class="first">Source</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="$section/n1:entry">
					<xsl:sort select="n1:substanceAdministration/n1:effectiveTime/@value" order="descending"/>
				</xsl:apply-templates>
			</tbody>
		</table>
		<br />
		<br />
	</xsl:template>

	<!-- Vitals Detail Section -->
	<xsl:template name="vitalsDetails">
		<xsl:param name="section"/>
		<table border="1" width="85%" style="font-size:14px">
		<tr class="second">
			<td width="20%">
				<b><xsl:text>Department of Veterans Affairs</xsl:text></b>
			</td>
			<td width="80%">
				<b><xsl:text>Description of the information included in this section</xsl:text></b>
			</td>
		</tr>
		<tr >
			<td width="20%">
				<xsl:text>Vital Signs</xsl:text>
			</td>
			<td width="80%">
				<xsl:text>This section contains inpatient and outpatient Vital Signs on record at VA for the patient.  The data comes from all VA treatment facilities.  It includes 12 months of data, with a maximum of the 10 most recent sets of vitals.  If more than one set of vitals was taken on the same date, only the most recent set is populated for that date.</xsl:text>
			</td>
		</tr>
		</table>
		<table border="1" width="85%" style="font-size:14px">
			<thead>
				<tr>
					<th class="first">
						<xsl:text>Date</xsl:text>
						<xsl:if test="n1:entry/n1:organizer">
							<xsl:text> - Count (</xsl:text>
							<xsl:value-of select="count(n1:entry/n1:organizer)"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</th>
					<th class="first">TEMP</th>
					<th class="first">PULSE</th>
					<th class="first">RESP</th>
					<th class="first">BP</th>
					<th class="first">Ht</th>
					<!--<th class="first">HT-Lying</th>-->
					<th class="first">Wt</th>
					<th class="first">POx</th>
					<!--<th class="first">OCF</th>-->
					<th class="first">Source</th>				
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="$section/n1:entry">
					<xsl:sort select="n1:organizer/n1:component/n1:observation/n1:effectiveTime/@value" order="descending"/>
				</xsl:apply-templates>
				<br/>
			</tbody>
		</table>
		<br />
        <table class="first" width="85%">
            <tr>
                <td width="50%" valign="top" align="left">
                    TEMP=Body Temperature (degrees Fahrenheit)
                </td>
                <td width="50%" valign="top" align="left">
                    Ht=Height (inches)
                </td>
            </tr>
            <tr>
                <td width="50%" valign="top" align="left">
                    PULSE=Pulse (beats/minute)
                </td>
                <td width="50%" valign="top" align="left">
                    Wt=Weight (pounds)
                </td>
            </tr>
            <tr>
                <td width="50%" valign="top" align="left">
                    RESP=Respiration (respirations/minute)
                </td>
                <td width="50%" valign="top" align="left">
                    POx=Pulse Oximetry (percent)
                </td>
            </tr>
            <tr>
                <td width="50%" valign="top" align="left">
                    BP=Blood pressure (systolic/diastolic)
                </td>
                <td width="50%" valign="top" align="left">
                    
                </td>
            </tr>
        </table>
        <br/><br/>
	</xsl:template>

	<!-- Encounter row entry -->
	<xsl:template name="encRow">
		<xsl:param name="row"/>
		<tr class="second">

			<!-- Encounter Date/Time-->
			<td>
				<div style="width:auto;">
					<xsl:choose>
						<xsl:when test="$row/n1:encounter/n1:effectiveTime/n1:low/@value">
							<xsl:call-template name="formatDateShort">
								<xsl:with-param name="dateString" select="$row/n1:encounter/n1:effectiveTime/n1:low/@value"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$row/n1:encounter/n1:effectiveTime/@value">
							<xsl:call-template name="formatDateShort">
								<xsl:with-param name="dateString" select="$row/n1:encounter/n1:effectiveTime/@value"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!-- Encounter Type  -->
			<td>
				<div style="width:auto;">
					<xsl:variable name="typeResult">
						<xsl:call-template name="getEncounterType">
							<xsl:with-param name="encounter" select="$row/n1:encounter"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($typeResult)>0">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$typeResult"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>

				</div>
			</td>

			<!-- Encounter Free Text -->
			<td>
				<div style="width:360px;height:1em">
					<xsl:variable name="encFreeText">
						<xsl:call-template name="ltrim">
							<xsl:with-param name="text">
								<xsl:call-template name="getEncounterFreeText">
									<xsl:with-param name="encounter" select="$row/n1:encounter"/>
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="startChar" select="'~'"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($encFreeText)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$encFreeText"/>
								<xsl:with-param name="freeText" select="'yes'"/>
								<xsl:with-param name="deSquigglefy" select="'yes'"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!-- Encounter Provider-->
			<td>
				<div style="width:160px;">
					<xsl:variable name="encProvider">
						<xsl:call-template name="getEncounterProvider">
							<xsl:with-param name="encounter" select="$row/n1:encounter"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($encProvider)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$encProvider"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="medRow">
		<xsl:param name="row"/>
		<tr class="second">
			<!-- Name -->
			<td>
				<div style="width:180px;">
					<xsl:call-template name="flyoverSpan">
						<xsl:with-param name="data">
							<xsl:call-template name="getMedicationName">
								<xsl:with-param name="row" select="$row"/>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</div>
			</td>

			<!-- Status -->
			<td>
				<div style="width:50px;">
					<xsl:variable name="medStat">
						<xsl:call-template name="medStatus">
							<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($medStat)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$medStat"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!-- Quantity -->
			<td>
				<div style="width:40px;">
					<xsl:call-template name="medQuantity">
						<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
					</xsl:call-template>
				</div>
			</td>

			<!-- Order Expiration Date/Time -->
			<td>
				<div style="width:80px;">
					<xsl:call-template name="medExpiretime">
						<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
					</xsl:call-template>
				</div>
			</td>

			<!-- Prescription ID (Nbr) -->
			<td>
				<div style="width:80px;">
					<xsl:variable name="rxNum">
						<xsl:call-template name="getRxNumString">
							<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($rxNum)>1">
							<xsl:value-of select="$rxNum"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!-- dispense time -->
			<td>
				<div style="width:75px;">
					<xsl:call-template name="medBegintime">
						<xsl:with-param name="row" select="$row"/>
					</xsl:call-template>
				</div>
			</td>

			<!-- Sig -->
			<td>
				<div style="width:160px;">
					<xsl:variable name="sig">
						<xsl:call-template name="getSig">
							<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($sig)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$sig"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!-- Provider -->
			<td class="tdWrap">
				<div style="width:100px;">
					<xsl:variable name="medProvider">
						<xsl:call-template name="getMedProvider">
							<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($medProvider)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$medProvider"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!-- source -->
			<td>
				<div style="width:100px;">
					<xsl:variable name="sourceResult">
						<xsl:call-template name="getMedSource">
							<xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="string-length($sourceResult)>1">
						<xsl:call-template name="flyoverSpan">
							<xsl:with-param name="data" select="$sourceResult"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="problemRow">
		<xsl:param name="row"/>
		<xsl:variable name="rowData" select="$row/n1:act/n1:entryRelationship/n1:observation"/>
		<tr class="second">

			<!-- name -->
			<td>
				<div style="width:240px;">
					<xsl:variable name="probResult">
						<xsl:call-template name="probName">
							<xsl:with-param name="probEntry" select="$row"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="string-length($probResult)>1">
                        	<xsl:choose>
                                <xsl:when test="contains($probResult, '(')">
                                	<xsl:call-template name="flyoverSpan">
                                	<xsl:with-param name="data" select="substring-before($probResult, '(')" />
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                	<xsl:call-template name="flyoverSpan">
                                    <xsl:with-param name="data" select="$probResult" />
                                    </xsl:call-template>
                                </xsl:otherwise>
							</xsl:choose>
					</xsl:if>
				</div>
			</td>

			<!-- status -->
			<td>
				<div style="width:80px;">
					<xsl:call-template name="probStatus">
						<xsl:with-param name="row" select="$row"/>
					</xsl:call-template>
				</div>
			</td>

			<!-- Problem Code -->
			<td>
				<div style="width:150px">
					<xsl:call-template name="getProblemCode">
						<xsl:with-param name="rowData" select="$rowData"/>
					</xsl:call-template>
				</div>
			</td>

			<!-- problem effective date -->
			<td>
				<div >
					<xsl:call-template name="probDate">
						<xsl:with-param name="row" select="$row"/>
					</xsl:call-template>
				</div>
			</td>

			<!-- provider -->
			<td>
				<div style="width:160px;">
					<xsl:variable name="provider"/>
					<xsl:call-template name="getProblemProvider">
						<xsl:with-param name="act" select="$row/n1:act"/>
					</xsl:call-template>
					<xsl:if test="string-length($provider)>2">
						<xsl:call-template name="flyoverSpan">
							<xsl:with-param name="data" select="$provider" />
						</xsl:call-template>
					</xsl:if>
				</div>
			</td>

			<!-- source -->
			<td>
				<div style="width:150px;">
					<xsl:variable name="source">
						<xsl:call-template name="getProblemSource">
							<xsl:with-param name="row" select="$row"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($source)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$source"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>
	</xsl:template>

	<!-- Allergy entry row -->
	<xsl:template name="allergyRow">
		<xsl:param name="row"/>
		<xsl:variable name="observation" select="$row/n1:act/n1:entryRelationship/n1:observation"/>
		<xsl:variable name="eR" select="$row/n1:act/n1:entryRelationship"/>
		<tr class="second">

			<!--Allergens-->
			<td>
				<div style="width:180px; padding-right:5px;">			
					<xsl:variable name="allergen">
						<xsl:call-template name="getAllergen">
							<xsl:with-param name="observation" select="$observation"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($allergen)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$allergen"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!--Verification Date-->
			<td>
				<div style="width:100px;">
					<xsl:call-template name="displayAllergyVerificationDate">
						<xsl:with-param name="observation" select="$observation"/>
					</xsl:call-template>
				</div>
			</td>

			<!--Event Type-->
			<td>
				<div style="width:180px;">
					<xsl:variable name="allergenType">
						<xsl:call-template name="getEventType">
							<xsl:with-param name="obs" select="$observation"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($allergenType)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$allergenType"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!--Reaction-->
			<td>
				<div style="width:180px;">
					<!--<xsl:for-each select="$observation/n1:entryRelationship[@typeCode='MFST']">-->
					<xsl:variable name="valueResult">
						<xsl:call-template name="getReactionValue">
							<xsl:with-param name="entryRelationship" select="$row/n1:act/n1:entryRelationship"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($valueResult)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$valueResult"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
					<!--</xsl:for-each>-->
				</div>
			</td>

			<!--Severity-->
			<td>
				<div style="width:100px;">
					<xsl:variable name="severity">
						<xsl:call-template name="getSeverity">
							<xsl:with-param name="observation" select="$observation"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($severity)>1">
							<xsl:value-of select="$severity"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>

			<!--source-->
			<td>
				<div style="width:150px;">
					<xsl:variable name="source">
						<xsl:call-template name="getAllergySource">
							<xsl:with-param name="row" select="$row"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($source)>0">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$source"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>

	</xsl:template>

	<!-- Procedures row entry -->
	<xsl:template name="procedureRow">
		<xsl:param name="row"/>
		<xsl:variable name="prcdrText">
			<xsl:call-template name="ltrim">
				<xsl:with-param name="text">
					<xsl:call-template name="getProcedureFreeText">
						<xsl:with-param name="procedure" select="$row/n1:procedure"/>
					</xsl:call-template>
				</xsl:with-param>
				<xsl:with-param name="startChar" select="'~'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$prcdrText=$notAvailable">
				<tr class="second">	
				<!-- Procedure Free Text Type-->
				<td colspan="7" align="center">
					<div style="height:1em">
						<xsl:variable name="procFreeText">
							<xsl:call-template name="ltrim">
								<xsl:with-param name="text">
									<xsl:call-template name="getProcedureFreeText">
										<xsl:with-param name="procedure" select="$row/n1:procedure"/>
									</xsl:call-template>
								</xsl:with-param>
								<xsl:with-param name="startChar" select="'~'"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($procFreeText)>1">
								<xsl:call-template name="flyoverSpan">
									<xsl:with-param name="data" select="$procFreeText"/>
									<xsl:with-param name="freeText" select="'yes'"/>
									<xsl:with-param name="deSquigglefy" select="'yes'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr class="second">
				<!-- Procedure Date/Time-->
				<td>
					<div >
						<xsl:choose>
							<xsl:when test="$row/n1:procedure/n1:effectiveTime/n1:low/@value">
								<xsl:call-template name="formatDateShort">
									<xsl:with-param name="dateString" select="$row/n1:procedure/n1:effectiveTime/n1:low/@value"/>
								</xsl:call-template>
							</xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="na"/>
                            </xsl:otherwise>
						</xsl:choose>
					</div>
				</td>
	
				<!-- Procedure Type  -->
				<td>
					<div style="width:260px;">
						<xsl:variable name="type">
							<xsl:call-template name="getProcedureType">
								<xsl:with-param name="procedure" select="$row/n1:procedure"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($type)>1">
								<xsl:call-template name="flyoverSpan">
									<xsl:with-param name="data" select="$type"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</td>
	
				<!-- Procedure Free Text Type-->
	
				<td>
					<div style="width:260px;height:1em">
						<xsl:variable name="procFreeText">
							<xsl:call-template name="ltrim">
								<xsl:with-param name="text">
									<xsl:call-template name="getProcedureFreeText">
										<xsl:with-param name="procedure" select="$row/n1:procedure"/>
									</xsl:call-template>
								</xsl:with-param>
								<xsl:with-param name="startChar" select="'~'"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($procFreeText)>1">
								<xsl:call-template name="flyoverSpan">
									<xsl:with-param name="data" select="$procFreeText"/>
									<xsl:with-param name="freeText" select="'yes'"/>
									<xsl:with-param name="deSquigglefy" select="'yes'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</td>
	
				<!-- Procedure Provider-->
				<td>
					<div style="width:180px;">
						<xsl:variable name="procProvider">
							<xsl:call-template name="getProcedureProvider">
								<xsl:with-param name="procedure" select="$row/n1:procedure"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($procProvider)>1">
								<xsl:call-template name="flyoverSpan">
									<xsl:with-param name="data" select="$procProvider"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</td>
			</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Labs entry row (organizer capable) -->
	<xsl:template name="labsRow">
		<xsl:param name="row"/>
		<xsl:variable name="observation1" select="$row/n1:component/n1:observation"/>
		<xsl:variable name="observation2" select="$row/n1:organizer/n1:component/n1:observation"/>
		<xsl:choose>
			<xsl:when  test="string-length($row/n1:organizer)!=0">
				<tr class="second">
					<!-- Result Date/Time -->
					<td>
						<div style="width:75px; padding-right:5px;">
							<xsl:variable name="date">
								<xsl:call-template name="getPanelDT">
									<xsl:with-param name="organizer" select="$row/n1:organizer"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="string-length($date)>0">
									<xsl:call-template name="flyoverSpan">
										<xsl:with-param name="data" select="$date"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="na"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</td>
					<!-- Organizer Name -->
					<td colspan="4">
						<div style="width:425px;">
							<xsl:variable name="organizerName">
								<xsl:call-template name="getOrganizerName">
									<xsl:with-param name="row" select="$row"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="string-length($organizerName)>0">
									<xsl:call-template name="flyoverSpan">
										<xsl:with-param name="data" select="$organizerName"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="na"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</td>
					<!--<td>
						<div style="width:75px;">
							<xsl:call-template name="na"/>
						</div>
					</td>
					<td>
						<div style="width:100px;">
							<xsl:call-template name="na"/>
						</div>
					</td>
					<td>
						<div style="width:130px;">
							<xsl:call-template name="na"/>
						</div>
					</td>-->
					<!-- Result Status -->
					<td>
						<div style="width:80px;">
							<xsl:choose>
								<xsl:when test="string-length($row/n1:organizer/n1:statusCode/@code)>0">
									<xsl:call-template name="flyoverSpan">
										<xsl:with-param name="data" select="$row/n1:organizer/n1:statusCode/@code"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="na"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</td>
					<!-- source -->
					<td>
						<div style="width:100px;">
							<xsl:choose>
								<xsl:when test="$row/n1:organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
									<xsl:value-of select="$row/n1:organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
								</xsl:when>
								<xsl:when test="$row/n1:organizer/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name">
									<xsl:value-of select="$row/n1:organizer/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"/>
								</xsl:when>
								<xsl:when test="$row/n1:organizer/n1:component/n1:observation/n1:participant[@typeCode='AUT']/n1:participantRole/n1:scopingEntity/n1:desc">
									<xsl:value-of select="$row/n1:organizer/n1:component/n1:observation/n1:participant[@typeCode='AUT']/n1:participantRole/n1:scopingEntity/n1:desc"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="na"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</td>
				</tr>
				<xsl:for-each select="$row/n1:organizer/n1:component/n1:observation">
					<tr class="third">
						<td>
							<div style="width:75px;">
							<xsl:call-template name="na"/>
							</div>
						</td>
						<!-- Result Type (Free-text)-->
						<td>
							<div style="width:120px;">
								<xsl:variable name="typeResult2">
									<xsl:call-template name="getResultType2">
										<xsl:with-param name="observation" select="."/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="string-length($typeResult2)>0">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$typeResult2"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="typeResult3">
											<xsl:call-template name="getResultType">
												<xsl:with-param name="observation" select="."/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:choose>
											<xsl:when test="string-length($typeResult3)>0">
												<xsl:call-template name="flyoverSpan">
													<xsl:with-param name="data" select="$typeResult3"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="na"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</td>
						<!-- Result Value -->
						<td>
							<div style="width:75px;">
								<xsl:variable name="valueResult2">
									<xsl:call-template name="getResultValue">
										<xsl:with-param name="observation" select="."/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="string-length($valueResult2)>0">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$valueResult2"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="na"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</td>
						<!-- interpretation -->
						<td>
							<div style="width:100px;">
								<xsl:variable name="interpResult1">
									<xsl:call-template name="getInterpretation2">
										<xsl:with-param name="observation" select="."/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="string-length($interpResult1)>0">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$interpResult1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="interpResult2">
											<xsl:call-template name="getInterpretation">
												<xsl:with-param name="observation" select="."/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:choose>
											<xsl:when test="string-length($interpResult2)>0">
												<xsl:call-template name="flyoverSpan">
													<xsl:with-param name="data" select="$interpResult2"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="na"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</td>
						<!-- ref range -->
						<td>
							<div style="width:130px;">
								<xsl:variable name="ref">
									<xsl:call-template name="getRefRange">
										<xsl:with-param name="observation" select="."/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="string-length($ref)>0">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$ref"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="na"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</td>
						<!-- Result Status -->
						<td>
							<div style="width:80px;">
								<xsl:choose>
									<xsl:when test="string-length(./n1:statusCode/@code)>0">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="./n1:statusCode/@code"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="na"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</td>
						<td>
							<div style="width:100px;">
							<xsl:call-template name="na"/>
							</div>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:when>
			<!-- No organizer with lab -->
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string-length($row/n1:observation/n1:code/@displayName)!=0 or $row/n1:observation/n1:text/n1:reference/@value">
						<tr class="second">
							<!-- Result Date/Time -->
							<td>
								<div style="width:75px; padding-right:5px;">
									<xsl:variable name="date2">
										<xsl:call-template name="getResultDT">
											<xsl:with-param name="observation" select="$row/n1:observation"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="string-length($date2)>0">
											<xsl:call-template name="flyoverSpan">
												<xsl:with-param name="data" select="$date2"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="na"/>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<!-- Result Type (Free-text)-->
							<td>
								<div style="width:120px;">
									<xsl:variable name="typeResult2">
										<xsl:call-template name="getResultType2">
											<xsl:with-param name="observation" select="$row/n1:observation"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="string-length($typeResult2)>0">
											<xsl:call-template name="flyoverSpan">
												<xsl:with-param name="data" select="$typeResult2"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:variable name="typeResult3">
												<xsl:call-template name="getResultType">
													<xsl:with-param name="observation" select="$row/n1:observation"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="string-length($typeResult3)>0">
													<xsl:call-template name="flyoverSpan">
														<xsl:with-param name="data" select="$typeResult3"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="na"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<!-- Result Value -->
							<td>
								<div style="overflow:hidden; width:75px;">
									<xsl:variable name="valueResult">
										<xsl:call-template name="getResultValue">
											<xsl:with-param name="observation" select="$row/n1:observation"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="string-length($valueResult)>0">
                                            <xsl:choose>
                                                <xsl:when test="$valueResult=$notAvailable">
                                                  <xsl:call-template name="dcna"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="flyoverSpan">
                                                        <xsl:with-param name="data" select="$valueResult"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                           	</xsl:choose>
                                        </xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="na"/>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<!-- interpretation -->
							<td>
								<div style="width:100px;">
									<xsl:variable name="interpResult1">
										<xsl:call-template name="getInterpretation2">
											<xsl:with-param name="observation" select="$row/n1:observation"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="string-length($interpResult1)>0">
											<xsl:call-template name="flyoverSpan">
												<xsl:with-param name="data" select="$interpResult1"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:variable name="interpResult2">
												<xsl:call-template name="getInterpretation">
													<xsl:with-param name="observation" select="$row/n1:observation"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="string-length($interpResult2)>0">
													<xsl:call-template name="flyoverSpan">
														<xsl:with-param name="data" select="$interpResult2"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="na"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<!-- ref range -->
							<td>
								<div style="width:130px;">
									<xsl:variable name="ref">
										<xsl:call-template name="getRefRange">
											<xsl:with-param name="observation" select="$row/n1:observation"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="string-length($ref)>0">
											<xsl:call-template name="flyoverSpan">
												<xsl:with-param name="data" select="$ref"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="na"/>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<!-- Result Status -->
							<td>
								<div style="width:80px;">
									<xsl:choose>
										<xsl:when test="string-length($row/n1:observation/n1:statusCode/@code)>0">
											<xsl:call-template name="flyoverSpan">
												<xsl:with-param name="data" select="$row/n1:observation/n1:statusCode/@code"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="na"/>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</td>
							<td>
								<div style="width:100px;">
									<xsl:call-template name="na"/>
								</div>
							</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- immunization entry row -->
	<xsl:template name="immunizationsRow">
		<xsl:param name="row"/>
		<xsl:variable name="rowData" select="$row/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial"/>
		<xsl:variable name="rowSubj" select="$row/n1:substanceAdministration/n1:entryRelationship[@typeCode='SUBJ']/n1:observation"/>
		<xsl:variable name="rowCause" select="$row/n1:substanceAdministration/n1:entryRelationship[@typeCode='CAUS']/n1:observation"/>
		<xsl:variable name="substanceAdministration" select="$row/n1:substanceAdministration"/>

		<tr class="second">
			<!-- name -->
			<td>
				<div style="width:200px;">
					<xsl:variable name="immunizationResult">
						<xsl:call-template name="getImmunization">
							<xsl:with-param name="substanceAdministration" select="$substanceAdministration"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($immunizationResult)>0">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$immunizationResult"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<!-- series -->
			<td>
				<div style="width:100px;">
					<xsl:variable name="seriesResult">
						<xsl:with-param name="data" select="$rowSubj/n1:value"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="string-length($seriesResult)>0">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$seriesResult"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<!--  effective date -->
			<td>
				<div style="width:100px;">
					<xsl:choose>
						<xsl:when test="string-length($row/n1:substanceAdministration/n1:effectiveTime/@value)=0">
							<xsl:text>-- Not Available --</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="formatDateShort">
								<xsl:with-param name="dateString" select="$row/n1:substanceAdministration/n1:effectiveTime/@value"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<!-- reaction -->
			<td>
				<xsl:value-of select="$rowCause/n1:id//@extension"/>
				<div style="width:260px;">
					<xsl:variable name="reactionReference" select="$rowCause/n1:id/@extension"/>
					<xsl:variable name="reaction" select="../n1:text//n1:content[@ID=$reactionReference]"/>
					<xsl:call-template name="flyoverSpan">
						<xsl:with-param name="data" select="$reaction"/>
					</xsl:call-template>
				</div>
			</td>
			<!-- comments -->
			<td>
				<xsl:variable name="commentReference" select="$row/n1:substanceAdministration/n1:text/n1:reference/@value"/>
				<div style="width:140px;">
					<xsl:call-template name="flyoverSpan">
						<xsl:with-param name="data" select="../n1:text//n1:content[@ID=$commentReference]"/>
					</xsl:call-template>
				</div>
			</td>
            <!-- source -->
			<td>
                <div style="width:100px;">
                    <xsl:choose>
                        <xsl:when test="$row/n1:substanceAdministration/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
                            <xsl:value-of select="$row/n1:substanceAdministration/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
                        </xsl:when>
                        <xsl:when test="$row/n1:substanceAdministration/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name">
                            <xsl:value-of select="$row/n1:substanceAdministration/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"/>
                        </xsl:when>
                        <xsl:when test="$row/n1:substanceAdministration/n1:component/n1:observation/n1:participant[@typeCode='AUT']/n1:participantRole/n1:scopingEntity/n1:desc">
                            <xsl:value-of select="$row/n1:substanceAdministration/n1:component/n1:observation/n1:participant[@typeCode='AUT']/n1:participantRole/n1:scopingEntity/n1:desc"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </td>
		</tr>
	</xsl:template>

	<!-- vitals entry row -->
	<xsl:template name="vitalsRow">
		<xsl:param name="row"/>
		<xsl:variable name="rowData" select="$row/n1:organizer/n1:component/n1:observation"/>
		<xsl:variable name="height" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincHeight]"/>
		<xsl:variable name="weight" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincWeight]"/>
		<xsl:variable name="systolic" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBpSystolic]"/>
		<xsl:variable name="diastolic" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBpDiastolic]"/>
		<xsl:variable name="temp" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincTemperature]"/>
		<xsl:variable name="pulse" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincPulse]"/>
		<xsl:variable name="resp" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincRespiration]"/>
		<xsl:variable name="pox" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincPulseOximetry]"/>
		<xsl:variable name="bloodPressure" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBloodPressure]"/>
		<xsl:variable name="bodyHtLying" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBodyHtLying]"/>
		<xsl:variable name="headCircumOCF" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincOCF]"/>
		<xsl:variable name="weight2" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincWeight2]"/>
		<tr class="second">
			<!-- Date -->
			<td>
				<div style="width:80px;">
					<xsl:choose>
						<xsl:when test="string-length($rowData/n1:effectiveTime/@value)=0">
							<xsl:text>-- Not Available --</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="formatDateShort">
								<xsl:with-param name="dateString" select="$rowData/n1:effectiveTime/@value"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>			
			<!-- temp -->
			<!-- <td>
				<div style="width:70px;">
					<xsl:for-each select="$temp">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="tempResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($tempResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$tempResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td> -->
			<!-- pulse -->
			<td>
				<div style="width:70px;">
					<xsl:for-each select="$pulse">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="pulseResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($pulseResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$pulseResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td>
			<!-- resp -->
			<td>
				<div style="width:70px;">
					<xsl:for-each select="$resp">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="respResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($respResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$respResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td>
			<!-- BP  systolic / diastolic -->
			<td>
				<div style="width:70px;">
					<xsl:choose>
						<xsl:when test="$systolic/n1:value/@value or $diastolic/n1:value/@value or $bloodPressure/n1:value/@value">
							<xsl:call-template name="bpDetailLister">
								<xsl:with-param name="systolics" select="$systolic"/>
								<xsl:with-param name="diastolics" select="$diastolic"/>
							</xsl:call-template>
							<xsl:if test="$systolic/n1:value/@value and $bloodPressure/n1:value/@value">
								<br/>
							</xsl:if>
							<xsl:for-each select="$bloodPressure">
								<xsl:if test="position()>1">
									<br/>
								</xsl:if>
								<xsl:value-of select="n1:value/@value"/>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
			<!-- height -->
			<td>
				<div style="width:70px;">
					<xsl:for-each select="$height">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="heightResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($heightResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$heightResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td>
			<!-- height lying-->
			<!--<td>
				<div style="width:70px;">
					<xsl:for-each select="$bodyHtLying">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="heightLyResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($heightLyResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$heightLyResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td>		-->	
			<!-- weight -->
			<td>
				<div style="width:70px;">
					<xsl:choose>
						<xsl:when test="string-length($weight2)>1">
							<xsl:call-template name="getWeightResult">
								<xsl:with-param name="wt" select="$weight2"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="getWeightResult">
								<xsl:with-param name="wt" select="$weight"/>
							</xsl:call-template>
						</xsl:otherwise>						
					</xsl:choose>
				</div>
			</td>



			<!-- pox -->
			<td>
				<div style="width:70px;">
					<xsl:for-each select="$pox">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="poxResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($poxResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$poxResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td>

			<!-- OCF -->
			<!--<td>
				<div style="width:70px;">
					<xsl:for-each select="$headCircumOCF">
						<xsl:if test="position()>1">
							<br/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="string-length(n1:value/@value)>1">
								<xsl:variable name="OCFResult" select="n1:value/@value"/>
								<xsl:choose>
									<xsl:when test="n1:value/@unit">
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="concat($OCFResult,n1:value/@unit)"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="flyoverSpan">
											<xsl:with-param name="data" select="$OCFResult"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="na"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
			</td>	-->		
			
			<!-- source -->
			<td>
				<div style="width:150px;">
					<xsl:choose>
						<xsl:when test="string-length($row/n1:organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$row/n1:organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="string-length(/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name)>1">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
							</xsl:call-template>
						</xsl:when>						
						<xsl:otherwise>
							<xsl:call-template name="na"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</td>
		</tr>
	</xsl:template>

	<!--   flyover -->
	<xsl:template name="flyoverSpan">
		<xsl:param name="data"/>
		<xsl:param name="freeText"/>
		<xsl:param name="deSquigglefy"/>
		<xsl:element name="span">
			<xsl:attribute name="onmouseover">
				<xsl:choose>
					<xsl:when test="$freeText">
						<xsl:text>DisplayTip(this,25,-50,1)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>DisplayTip(this,25,-50,0)</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="$data">
					<xsl:choose>
						<xsl:when test="$deSquigglefy">
							<xsl:call-template name="replaceSquigglesWithBreaks">
								<xsl:with-param name="text" select="$data"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$data"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="na"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>

	<xsl:template name="replaceSquigglesWithBreaks">
		<xsl:param name="text"/>
		<xsl:if test="$text">
			<xsl:choose>
				<xsl:when test="contains($text,'~')">
					<xsl:value-of select="substring-before($text,'~')"/>
					<br/>
					<xsl:call-template name="replaceSquigglesWithBreaks">
						<xsl:with-param name="text" select="substring-after($text,'~')"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$text"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!--   Title  -->
	<xsl:template match="n1:title">
		<xsl:variable name="compFound">
			<xsl:call-template name="componentFound">
				<xsl:with-param name="compSection" select="../."/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($compFound)>0">
				<h3>
					<span style="font-weight:bold;line-height:40%">
						<a name="{generate-id(.)}" href="#toc">
							<xsl:value-of select="."/>
						</a>
					</span>
				</h3>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!--   Text   -->
	<xsl:template match="n1:text">
		<xsl:apply-templates />
	</xsl:template>

	<!--   paragraph  -->
	<xsl:template match="n1:paragraph">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<!--     Content w/ deleted text is hidden -->
	<xsl:template match="n1:content[@revised='delete']"/>

	<!--   content  -->
	<xsl:template match="n1:content">
		<xsl:apply-templates/>
	</xsl:template>


	<!--   list  -->
	<xsl:template match="n1:list">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ul>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates />
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="n1:list[@listType='ordered']">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ol>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates />
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>


	<!--   caption  -->
	<xsl:template match="n1:caption">
		<xsl:apply-templates/>
		<xsl:text>: </xsl:text>
	</xsl:template>

	<!--      Tables   -->
	<xsl:template match="n1:table/@*|n1:thead/@*|n1:tfoot/@*|n1:tbody/@*|n1:colgroup/@*|n1:col/@*|n1:tr/@*|n1:th/@*|n1:td/@*">
		<xsl:copy>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="n1:table">
		<table>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>

	<xsl:template match="n1:thead">
		<thead>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</thead>
	</xsl:template>

	<xsl:template match="n1:tfoot">
		<tfoot>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tfoot>
	</xsl:template>

	<xsl:template match="n1:tbody">
		<tbody>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>

	<xsl:template match="n1:colgroup">
		<colgroup>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</colgroup>
	</xsl:template>

	<xsl:template match="n1:col">
		<col>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</col>
	</xsl:template>

	<xsl:template match="n1:tr">
		<tr>

			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>

	<xsl:template match="n1:th">
		<th>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</th>
	</xsl:template>

	<xsl:template match="n1:td">
		<td>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</td>
	</xsl:template>

	<xsl:template match="n1:table/n1:caption">
		<span style="font-weight:bold; ">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!--   RenderMultiMedia 

         this currently only handles GIF's and JPEG's.  It could, however,
	 be extended by including other image MIME types in the predicate
	 and/or by generating <object> or <applet> tag with the correct
	 params depending on the media type  @ID  =$imageRef     referencedObject
 -->
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRef" select="@referencedObject"/>
		<xsl:choose>
			<xsl:when test="//n1:regionOfInterest[@ID=$imageRef]">
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if test='//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value[@mediaType="image/gif" or @mediaType="image/jpeg"]'>
					<br clear='all'/>
					<xsl:element name='img'>
						<xsl:attribute name='src'>
							<xsl:value-of select='//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value/n1:reference/@value'/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- Here is where the direct MultiMedia image referencing goes -->
				<xsl:if test='//n1:observationMedia[@ID=$imageRef]/n1:value[@mediaType="image/gif" or @mediaType="image/jpeg"]'>
					<br clear='all'/>
					<xsl:element name='img'>
						<xsl:attribute name='src'>
							<xsl:value-of select='//n1:observationMedia[@ID=$imageRef]/n1:value/n1:reference/@value'/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 	Stylecode processing   
	  Supports Bold, Underline and Italics display

-->

	<xsl:template match="//n1:*[@styleCode]">

		<xsl:if test="@styleCode='Bold'">
			<xsl:element name='b'>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>

		<xsl:if test="@styleCode='Italics'">
			<xsl:element name='i'>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>

		<xsl:if test="@styleCode='Underline'">
			<xsl:element name='u'>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>

		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Italics') and not (contains(@styleCode, 'Underline'))">
			<xsl:element name='b'>
				<xsl:element name='i'>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>

		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Italics'))">
			<xsl:element name='b'>
				<xsl:element name='u'>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>

		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Bold'))">
			<xsl:element name='i'>
				<xsl:element name='u'>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>

		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and contains(@styleCode, 'Bold')">
			<xsl:element name='b'>
				<xsl:element name='i'>
					<xsl:element name='u'>
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>

	</xsl:template>

	<!-- 	Superscript or Subscript   -->
	<xsl:template match="n1:sup">
		<xsl:element name='sup'>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="n1:sub">
		<xsl:element name='sub'>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<!--  Bottomline  -->

	<xsl:template name="displayBottomLine">
		<p>
			<xsl:variable name="found"/>
			<xsl:call-template name="getName">
				<xsl:with-param name="name" select="n1:legalAuthenticator/n1:assignedEntity/n1:representedOrganization/n1:name"/>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="$found">
					<b>
						<xsl:text>Electronically generated by: </xsl:text>
						<xsl:value-of select="$found"/>
					</b>
				</xsl:when>
				<xsl:otherwise>
					<b>
						<xsl:text disable-output-escaping="yes"> Electronically generated on:   </xsl:text>
						<xsl:value-of select="$found"/>
					</b>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(n1:effectiveTime/@value)=0">
					<xsl:call-template name="na"/>
				</xsl:when>
				<xsl:when test="starts-with(n1:effectiveTime/@value,' ')">
					<xsl:call-template name="na"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="dateFound"/>
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="n1:effectiveTime/@value"/>
					</xsl:call-template>
					<xsl:if test="($dateFound) and not ($found)">
						<xsl:text disable-output-escaping="yes">  on   </xsl:text>
						<xsl:value-of select="$dateFound"/>
					</xsl:if>
					<xsl:if test="($dateFound) and ($found)">
						<xsl:value-of select="$dateFound"/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</p>
        <br/>
        <table class="first" width="85%">
            <tr>
                <td width="100%" valign="top" align="center">
                    <b>END OF VA CONTINUITY OF CARE DOCUMENT (VA CCD)</b>
                </td>
            </tr>
        </table>
        
		<div id="TipBox" style="display:none;position:absolute;font-size:12px;font-weight:bold;font-family:verdana;border:#72B0E6 solid 1px;padding:15px;color:black;background-color:#FFFFFF;">
			<xsl:text disable-output-escaping="yes">  </xsl:text>
		</div>
	</xsl:template>

	<xsl:template match="n1:component/n1:section[n1:templateId/@root='2.16.840.1.113883.10.20.1.11']/n1:text/n1:table/n1:tbody">
		<xsl:apply-templates>
			<xsl:sort select="n1:td[3]" order="descending"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="n1:component/n1:section[n1:templateId/@root='2.16.840.1.113883.10.20.1.8']/n1:text/n1:table/n1:tbody">
		<xsl:apply-templates>
			<xsl:sort select="n1:td[5]" order="descending"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="n1:component/n1:section[n1:templateId/@root='2.16.840.1.113883.10.20.1.16' or n1:templateId/@root='2.16.840.1.113883.10.20.1.14' or n1:templateId/@root='2.16.840.1.113883.10.20.1.6' or n1:templateId/@root='2.16.840.1.113883.10.20.1.3']/n1:text/n1:table/n1:tbody">
		<xsl:apply-templates>
			<xsl:sort select="n1:td[2]" order="descending"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="n1:component/n1:section[n1:templateId/@root='2.16.840.1.113883.10.20.1.11']/n1:text/n1:table/n1:tbody/n1:tr/n1:td[3]">
		<td>
			<xsl:call-template name="formatDateShort">
				<xsl:with-param name="dateString"
				 select="text()"/>
			</xsl:call-template>
		</td>
	</xsl:template>

	<xsl:template match="n1:component/n1:section[n1:templateId/@root='2.16.840.1.113883.10.20.1.8']/n1:text/n1:table/n1:tbody/n1:tr/n1:td[5]">
		<td>
			<xsl:call-template name="formatDateShort">
				<xsl:with-param name="dateString"
					 select="text()"/>
			</xsl:call-template>
		</td>
	</xsl:template>

	<xsl:template match="n1:component/n1:section[n1:templateId/@root='2.16.840.1.113883.10.20.1.16' or n1:templateId/@root='2.16.840.1.113883.10.20.1.14' or n1:templateId/@root='2.16.840.1.113883.10.20.1.6' or n1:templateId/@root='2.16.840.1.113883.10.20.1.3']/n1:text/n1:table/n1:tbody/n1:tr/n1:td[2]">
		<td>
			<xsl:call-template name="formatDateShort">
				<xsl:with-param name="dateString"
					 select="concat(substring(text(),1,4),substring(text(),6,2),substring(text(),9,2))"/>
			</xsl:call-template>
		</td>
	</xsl:template>

	<xsl:template name="na">
		<span title="Not Available">
			<xsl:text>--</xsl:text>
		</span>
	</xsl:template>

	<!-- free text processing -->

	<xsl:template name="freeText">
		<xsl:param name="text"/>

	</xsl:template>

	<xsl:template name="display1LineBreak">
		<br/>
	</xsl:template>

	<xsl:template name="displayVitalsMultiSeparator">
		<xsl:call-template name="display1LineBreak"/>
	</xsl:template>

	<xsl:template name="displayVitalRow">
		<xsl:param name="row"/>
		<tr class="second">
			<xsl:call-template name="displayVitalItems">
				<xsl:with-param name="row" select="$row"/>
			</xsl:call-template>
		</tr>
	</xsl:template>

	<xsl:template name="displayVitalsDateItem">
		<xsl:param name="rowData"/>
		<td>
			<div style="width:80px;">
				<xsl:call-template name="displayVitalsDate">
					<xsl:with-param name="rowData" select="$rowData"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsTempItem">
		<xsl:param name="temp"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsTemp">
					<xsl:with-param name="temp" select="$temp"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsSourceItem">
		<xsl:param name="row"/>
		<td>
			<div style="width:150px;">
				<xsl:call-template name="displayVitalsSource">
					<xsl:with-param name="row" select="$row"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsPoxItem">
		<xsl:param name="pox"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsPox">
					<xsl:with-param name="pox" select="$pox"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsWeightItem">
		<xsl:param name="weight"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsWeight">
					<xsl:with-param name="weight" select="$weight"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsHeightItem">
		<xsl:param name="height"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsHeight">
					<xsl:with-param name="height" select="$height"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsBpItem">
		<xsl:param name="row"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsBp">
					<xsl:with-param name="row" select="$row"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsRespItem">
		<xsl:param name="resp"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsResp">
					<xsl:with-param name="resp" select="$resp"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="displayVitalsPulseItem">
		<xsl:param name="pulse"/>
		<td>
			<div style="width:70px;">
				<xsl:call-template name="displayVitalsPulse">
					<xsl:with-param name="pulse" select="$pulse"/>
				</xsl:call-template>
			</div>
		</td>
	</xsl:template>

	<xsl:template name="getWeightResult">
		<xsl:param name="wt" />
		<xsl:for-each select="$wt">
			<xsl:if test="position()>1">
				<br/>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="string-length(n1:value/@value)>1">
					<xsl:variable name="weightResult" select="n1:value/@value"/>
					<xsl:choose>
						<xsl:when test="n1:value/@unit">
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="concat($weightResult,n1:value/@unit)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="flyoverSpan">
								<xsl:with-param name="data" select="$weightResult"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="na"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

	</xsl:template>
  <!-- from formatting.xsl-->  
    <!-- Format first(given) and last (family) names-->
  <xsl:template name="formatProviderName">
    <xsl:param name="first"/>
    <xsl:param name="last"/>
    <xsl:choose>
      <xsl:when test="$first and $last">
        <xsl:value-of select="$last"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="$first"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="formatComments">
    <xsl:param name="comments"/>
  <div>
    <table class="comments">
      <tbody>
        <tr>
          <td>
            <img src="resources/images/C32_notice.jpg" alt="NOTE:"/>
            <xsl:value-of select="$comments"/>
          </td>
        </tr>
      </tbody>
    </table>
    <br/>
  </div>
  </xsl:template>
  
  <!-- from nhinCommon.xsl-->
  
	<xsl:variable name="isKaiser" select="boolean(/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:id[@root='1.3.6.1.4.1.26580'])"/>
	<xsl:variable name="isDoD" select="boolean(/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:id[@root='2.16.840.1.113883.3.42.10001.100001.12'])"/>
	<xsl:variable name="isMVA" select="boolean(/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:id[@root='2.16.840.1.113883.3.190'])"/>
	<xsl:variable name="isINHS" select="boolean(/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:id[@root='2.16.840.1.113883.3.715'])"/>
	<xsl:variable name="isMultiCare" select="boolean((/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:id[@root='1.2.840.114350.1.13.60.2.7.2.696570']) or (/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:id[@root='1.2.840.114350.1.13.77002.1.7.2.696570']))"/>
	<xsl:variable name="noMdoProb" select="boolean(/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section/n1:entry/n1:act/n1:entryRelationship/n1:observation/n1:value[@code='396782006'])"/>
	<xsl:variable name="noMed" select="boolean(/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section/n1:entry/n1:substanceAdministration/n1:code[@code='182849000'])"/>
	<xsl:variable name="noMdoResult" select="boolean(/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section/n1:entry/n1:organizer/n1:code[@code='261665006'])"/>
	<xsl:variable name="allergyNkaCode">160244002</xsl:variable>
    <xsl:variable name="notAvailable">Result Procedure Text Not Available</xsl:variable>

	<xsl:template name="facilityProperty">
		<xsl:variable name="root" select="/n1:ClinicalDocument"/>
		<Facility>
			<xsl:choose>
				<xsl:when test="$root/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name and string-length($root/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name)>0">
					<xsl:value-of select="$root/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"/>
				</xsl:when>

				<xsl:when test="$root/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name and string-length($root/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name)>0">
					<xsl:value-of select="$root/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</Facility>

	</xsl:template>

	<xsl:template name="genderString">
		<xsl:param name="sex" select="'unknown'"/>
		<xsl:choose>
			<xsl:when test="$sex='M' or $sex='m' or $sex='Male' or $sex='male'">
				<xsl:text>Male</xsl:text>
			</xsl:when>
			<xsl:when test="$sex='F' or $sex='f' or $sex='Female' or $sex='female'">
				<xsl:text>Female</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="displayLanguages">
		<xsl:param name="patientRole"/>
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($patientRole/n1:patient/n1:languageCommunication/n1:languageCode/@code))>0">
				<xsl:apply-templates select="$patientRole/n1:patient/n1:languageCommunication/n1:languageCode"/>
			</xsl:when>
			<xsl:when test="string-length(normalize-space($patientRole/../../n1:languageCommunication/n1:languageCode/@code))>0">
				<xsl:apply-templates select="$patientRole/../../n1:languageCommunication/n1:languageCode"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$patientRole/../../n1:languageCode"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="n1:languageCode" mode="data">
		<xsl:choose>
			<xsl:when test="string-length(@code)=0"/>
			<xsl:when test="@code='en' or @code='en-US'">
				<xsl:text>English</xsl:text>
			</xsl:when>
			<xsl:when test="@code='es' or @code='es-US'">
				<xsl:text>Spanish</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="isLanguageFound">
		<xsl:param name="patientRole"/>
		<xsl:variable name="langs">
			<xsl:value-of select="$patientRole/n1:patient/n1:languageCommunication/n1:languageCode/@code"/>
			<xsl:value-of select="$patientRole/../../n1:languageCommunication/n1:languageCode/@code"/>
			<xsl:value-of select="$patientRole/../../n1:languageCode/@code"/>
		</xsl:variable>
		<xsl:value-of select="string-length(normalize-space($langs))>0"/>
	</xsl:template>
	
	<!-- Allergies -->

	<xsl:template name="getAllergen">
		<xsl:param name="observation"/>
		<xsl:if test="$observation">
			<xsl:choose>
				<xsl:when test="$observation/n1:value[@code=$allergyNkaCode]">
					<xsl:text>NKA</xsl:text>
				</xsl:when>
				<xsl:when test="string-length($observation/n1:participant/n1:participantRole/n1:playingEntity/n1:name)>1">
					<xsl:value-of select="$observation/n1:participant/n1:participantRole/n1:playingEntity/n1:name"/>
				</xsl:when>
				<xsl:when test="$observation/n1:text/n1:reference/@value">
					<xsl:variable name = "reactionNameRef1" select="$observation/n1:text/n1:reference/@value"/>
					<xsl:variable name = "reactionNameRef2" select="substring($observation/n1:text/n1:reference/@value,2)"/>
					<xsl:if test="../n1:text//n1:td[@ID=$reactionNameRef1]">
						<xsl:value-of select="../n1:text//n1:td[@ID=$reactionNameRef1]"/>
					</xsl:if>
					<xsl:if test="../n1:text//n1:td[@ID=$reactionNameRef2]">
						<xsl:value-of select="../n1:text//n1:td[@ID=$reactionNameRef2]"/>
					</xsl:if>
					<xsl:if test="../n1:text//n1:content[@ID=$reactionNameRef1]">
						<xsl:value-of select="../n1:text//n1:content[@ID=$reactionNameRef1]"/>
					</xsl:if>
					<xsl:if test="../n1:text//n1:content[@ID=$reactionNameRef2]">
						<xsl:value-of select="../n1:text//n1:content[@ID=$reactionNameRef2]"/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$observation/n1:participant[@typeCode='CSM']/n1:participantRole[@classCode='MANU']/n1:playingEntity[@classCode='MMAT']/n1:code/n1:originalText/n1:reference/@value">
					<xsl:variable name = "reactionNameRef1" select="$observation/n1:participant/n1:participantRole/n1:playingEntity/n1:code/n1:originalText/n1:reference/@value"/>
					<xsl:variable name = "reactionNameRef2" select="substring-after($observation/n1:participant/n1:participantRole/n1:playingEntity/n1:code/n1:originalText/n1:reference/@value,'#')"/>
					<xsl:if test="../n1:text//n1:td[@ID=$reactionNameRef1]">
						<xsl:value-of select="../n1:text//n1:td[@ID=$reactionNameRef1]"/>
					</xsl:if>
					<xsl:if test="../n1:text//n1:td[@ID=$reactionNameRef2]">
						<xsl:value-of select="../n1:text//n1:td[@ID=$reactionNameRef2]"/>
					</xsl:if>
					<xsl:if test="../n1:text//n1:content[@ID=$reactionNameRef1]">
						<xsl:value-of select="../n1:text//n1:content[@ID=$reactionNameRef1]"/>
					</xsl:if>
					<xsl:if test="../n1:text//n1:content[@ID=$reactionNameRef2]">
						<xsl:value-of select="../n1:text//n1:content[@ID=$reactionNameRef2]"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$observation/n1:participant[@typeCode='CSM']/n1:participantRole[@classCode='MANU']/n1:playingEntity[@classCode='MMAT']"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getAllergenText">
		<xsl:param name="observation"/>
		<xsl:if test="$observation">
			<xsl:choose>
				<xsl:when test="$observation/n1:participant/n1:participantRole/n1:playingEntity/n1:name or $observation/n1:participant[@typeCode='CSM']/n1:participantRole[@classCode='MANU']/n1:playingEntity[@classCode='MMAT']/@name">
					<xsl:value-of select="$observation/n1:participant/n1:participantRole/n1:playingEntity/n1:name"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$observation/participant[@typeCode='CSM']/n1:participantRole[@classCode='MANU']/n1:playingEntity[@classCode='MMAT']/@name"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getAllergyVerificationDate">
		<xsl:param name="observation"/>
		<xsl:if test="string-length($observation/n1:effectiveTime/n1:low/@value)>0">
			<xsl:value-of select="$observation/n1:effectiveTime/n1:low/@value"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getEventType">
		<xsl:param name="obs"/>
		<xsl:choose>
			<xsl:when test="$obs/n1:code/@displayName and not($isKaiser)">
				<xsl:value-of select="$obs/n1:code/@displayName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getReactionValueFromReference">
		<xsl:param name="reactionReference"/>
		<xsl:param name="section"/>
		<xsl:variable name="reactionValue" select="$section//n1:content[@ID=$reactionReference]"/>
		<xsl:variable name="reactionValue2" select="$section//n1:content[@ID=substring-after($reactionReference,'#')]"/>
		<xsl:variable name="reactionValue3" select="$section//n1:td[@ID=$reactionReference]"/>
		<xsl:variable name="reactionValue4" select="$section//n1:td[@ID=substring-after($reactionReference,'#')]"/>
		<xsl:if test="string-length($reactionValue)>1">
			<xsl:if test="position()>1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="$reactionValue"/>
		</xsl:if>
		<xsl:if test="string-length($reactionValue2)>1">
			<xsl:if test="position()>1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="$reactionValue2"/>
		</xsl:if>
		<xsl:if test="string-length($reactionValue3)>1">
			<xsl:if test="position()>1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="$reactionValue3"/>
		</xsl:if>
		<xsl:if test="string-length($reactionValue4)>1">
			<xsl:if test="position()>1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="$reactionValue4"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getReactionValue">
		<xsl:param name="entryRelationship"/>
		<xsl:variable name="section" select="$entryRelationship/../../../n1:text"/>
		<xsl:choose>
			<xsl:when test="$entryRelationship/n1:observation/n1:entryRelationship/n1:observation/n1:text/n1:reference[@value]">
				<xsl:for-each select="$entryRelationship/n1:observation/n1:entryRelationship/n1:observation/n1:text/n1:reference">
					<xsl:call-template name="getReactionValueFromReference">
						<xsl:with-param name="reactionReference" select="@value"/>
						<xsl:with-param name="section" select="$section"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$entryRelationship/n1:observation/n1:text/n1:reference[@value]">
				<xsl:for-each select="$entryRelationship/n1:observation/n1:text/n1:reference">
					<xsl:call-template name="getReactionValueFromReference">
						<xsl:with-param name="reactionReference" select="@value"/>
						<xsl:with-param name="section" select="$section"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$entryRelationship/n1:observation/n1:entryRelationship[@typeCode='MFST']/n1:observation/n1:text/n1:reference[@value]">
				<xsl:for-each select="$entryRelationship/n1:observation/n1:entryRelationship[@typeCode='MFST']/n1:observation/n1:text/n1:reference">
					<xsl:call-template name="getReactionValueFromReference">
						<xsl:with-param name="reactionReference" select="@value"/>
						<xsl:with-param name="section" select="$section"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getAllergySource">
		<xsl:param name="row"/>
		<xsl:choose>
			<xsl:when test="$row/n1:act/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="$row/n1:act/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name">
				<xsl:value-of select="$row/n1:act/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:when test="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation[@classCode='OBS']/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS']/n1:informant/n1:assignedEntity/n1:representedOrganization/n1:name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getSeverity">
		<xsl:param name="observation"/>
		<xsl:variable name="severityReference" select="$observation//n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:text/n1:reference/@value"/>
		<xsl:variable name="sevData1" select="$observation/../../../../n1:text//n1:content[@ID=$severityReference]"/>
		<xsl:variable name="sevData2" select="$observation/../../../../n1:text//n1:content[@ID=substring-after($severityReference,'#')]"/>
		<xsl:variable name="sevData3" select="$observation/../../../../n1:text//n1:td[@ID=$severityReference]"/>
		<xsl:variable name="sevData4" select="$observation/../../../../n1:text//n1:td[@ID=substring-after($severityReference,'#')]"/>
		<xsl:choose>
			<xsl:when test="string-length($sevData1)>=1" >
				<xsl:value-of select="$sevData1"/>
			</xsl:when>
			<xsl:when test="string-length($sevData2)>=1" >
				<xsl:value-of select="$sevData2"/>
			</xsl:when>
			<xsl:when test="string-length($sevData3)>=1" >
				<xsl:value-of select="$sevData3"/>
			</xsl:when>
			<xsl:when test="string-length($sevData4)>=1" >
				<xsl:value-of select="$sevData4"/>
			</xsl:when>
			<xsl:otherwise >
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getReactionCoded">
		<xsl:param name="eR"/>
		<xsl:variable name="coded" select="$eR[@inversionInd='true' and @typeCode='MFST']"/>
		<xsl:for-each select="$coded">
			<xsl:if test="n1:observation/n1:value/n1:translation/@displayName">
				<xsl:value-of select="n1:observation/n1:value/n1:translation/@displayName"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<!-- Encounters -->

	<xsl:template name="getEncounterID">
		<xsl:param name="encounter"/>
		<xsl:choose>
			<xsl:when test="$encounter/n1:id/@root">
				<xsl:value-of select="$encounter/n1:id/@root"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getEncounterType">
		<xsl:param name="encounter"/>
		<xsl:variable name="encounterReference" select="$encounter/n1:text/n1:reference/@value" />
		<xsl:if test="$encounter">
			<xsl:choose>
				<xsl:when test="$encounter/n1:code/@displayName">
					<xsl:value-of select="$encounter/n1:code/@displayName"/>
				</xsl:when>
				<xsl:when test="$encounter/n1:text/n1:reference/@value">
					<xsl:value-of select="$encounter/../../n1:text//n1:td[@ID=substring-after($encounterReference,'#')]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="na"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getEncounterFreeText">
		<xsl:param name="encounter"/>
		<xsl:variable name="encRef1" select="$encounter/n1:text/n1:reference/@value"/>
		<xsl:variable name="encRef2" select="substring-after($encRef1,'#')"/>
		<xsl:call-template name="getEncounterFreeTextWithKey">
			<xsl:with-param name="encounter" select="$encounter"/>

			<xsl:with-param name="key" select="$encRef1"/>
		</xsl:call-template>
		<xsl:call-template name="getEncounterFreeTextWithKey">
			<xsl:with-param name="encounter" select="$encounter"/>
			<xsl:with-param name="key" select="$encRef2"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="getEncounterFreeTextWithKey">
		<xsl:param name="encounter"/>
		<xsl:param name="key"/>
		<xsl:if test="string-length(normalize-space($encounter/../../n1:text//n1:content[@ID=$key]))>0">
			<xsl:value-of select="normalize-space($encounter/../../n1:text//n1:content[@ID=$key])"/>
		</xsl:if>
		<xsl:if test="string-length(normalize-space($encounter/../../n1:text//n1:td[@ID=$key]))>0">
			<xsl:value-of select="normalize-space($encounter/../../n1:text//n1:td[@ID=$key])"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getEncounterDateTime">
		<xsl:param name="encounter"/>
		<xsl:if test="$encounter">
			<xsl:choose>
				<xsl:when test="$encounter/n1:effectiveTime/n1:low/@value">
					<xsl:value-of select="$encounter/n1:effectiveTime/n1:low/@value"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getEncounterProvider">
		<xsl:param name="encounter"/>
		<xsl:if test="$encounter">
			<xsl:choose>
				<xsl:when test="$encounter/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family and $encounter/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given">
					<xsl:variable name="first" select="$encounter/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					<xsl:variable name="last" select="$encounter/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					<xsl:call-template name="formatProviderName">
						<xsl:with-param name="first" select="$first"/>
						<xsl:with-param name="last" select="$last"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$encounter/n1:performer/n1:assignedEntity/n1:assignedPerson"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!--Procedures -->

	<xsl:template name="getProcedureID">
		<xsl:param name="procedure"/>
		<xsl:if test="$procedure">
			<xsl:choose>
				<xsl:when test="$procedure/n1:id/@root">
					<xsl:value-of select="$procedure/n1:id/@root"/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getProcedureType">
		<xsl:param name="procedure"/>
		<xsl:variable name="displayName" select="$procedure/n1:code/@displayName"/>
		<xsl:variable name="code" select="$procedure/n1:code/@code"/>
		<xsl:choose>
			<xsl:when test="contains($displayName,$code)">
				<xsl:value-of select="substring-after($displayName,$code)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$procedure/n1:code/@displayName"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="getProcedureFreeText">
		<xsl:param name="procedure"/>
		<xsl:variable name="procRef" select="substring-after($procedure/n1:text/n1:reference/@value,'#')"/>
		<xsl:variable name="proc1" select="$procedure/../../n1:text//n1:content[@ID=$procRef]"/>
		<xsl:variable name="proc2" select="$procedure/../../n1:text//n1:tr[@ID=$procRef]"/>
		<xsl:choose>
			<xsl:when test="string-length($proc1)>1">
				<xsl:value-of select="$proc1"/>
			</xsl:when>
			<xsl:when test="string-length($proc2)>1">
				<xsl:value-of select="$proc2"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getProcedureDateTime">
		<xsl:param name="procedure"/>
		<xsl:if test="$procedure">
			<xsl:choose>
				<xsl:when test="$procedure/n1:effectiveTime/n1:low/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$procedure/n1:effectiveTime/n1:low/@value"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getProcedureProvider">
		<xsl:param name="procedure"/>
		<xsl:if test="$procedure">
			<xsl:choose>
				<xsl:when test="$procedure/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family and $procedure/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given">
					<xsl:variable name="first" select="$procedure/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					<xsl:variable name="last" select="$procedure/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					<xsl:call-template name="formatProviderName">
						<xsl:with-param name="first" select="$first"/>
						<xsl:with-param name="last" select="$last"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$procedure/n1:performer/n1:assignedEntity/n1:assignedPerson"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!--Medications -->

	<xsl:template name="medDateBeginString">
		<xsl:param name="substanceAdmin"/>
		<xsl:call-template name="shortenDate">
			<xsl:with-param name="inString">
				<xsl:choose>
					<xsl:when test="$substanceAdmin/n1:effectiveTime/n1:low/@value and not($isINHS)">
						<xsl:value-of select="$substanceAdmin/n1:effectiveTime/n1:low/@value"/>
					</xsl:when>
					<xsl:when test="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='EVN']/n1:effectiveTime/@value">
						<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='EVN']/n1:effectiveTime/@value"/>
					</xsl:when>
					<xsl:when test="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:effectiveTime/@value">
						<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:effectiveTime/@value"/>
					</xsl:when>
				</xsl:choose>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="getMedicationName">
		<xsl:param name="row"/>
		<xsl:variable name="substanceAdmin" select="$row/n1:substanceAdministration"/>
		<xsl:variable name="ref1" select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:originalText/n1:reference/@value"/>
		<xsl:variable name="refShort" select="substring-after($ref1,'#')"/>
		<xsl:if test="$substanceAdmin">
			<xsl:choose>
				<xsl:when test="string-length(normalize-space($row/../n1:text//n1:content[@ID=$refShort]))>0">
					<xsl:value-of select="normalize-space($row/../n1:text//n1:content[@ID=$refShort])"/>
				</xsl:when>

				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName)"/>
				</xsl:when>

				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name)"/>
				</xsl:when>

				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName)"/>
				</xsl:when>

				<xsl:when test="string-length(normalize-space($row/../n1:text//n1:td[@ID=$refShort]))>0">
					<xsl:value-of select="normalize-space($row/../n1:text//n1:td[@ID=$refShort])"/>
				</xsl:when>
				
				<xsl:otherwise>
					<xsl:value-of select="normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:originalText)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="medExpireDateString">
		<xsl:param name="substanceAdmin"/>
		<xsl:call-template name="shortenDate">
			<xsl:with-param name="inString">
				<xsl:choose>
					<xsl:when test="string-length($substanceAdmin/n1:effectiveTime/n1:high/@value)>1">
						<xsl:value-of select="$substanceAdmin/n1:effectiveTime/n1:high/@value"/>
					</xsl:when>
					<xsl:when test="string-length($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:effectiveTime/n1:high/@value)>1">
						<xsl:value-of select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:effectiveTime/n1:high/@value"/>
					</xsl:when>
					<xsl:when test="string-length($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:effectiveTime/@value)>1">
						<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:effectiveTime/@value"/>
					</xsl:when>
				</xsl:choose>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="getMedStatusString">
		<xsl:param name="substanceAdmin"/>
		<xsl:if test="$substanceAdmin">
			<xsl:choose>
				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN' and n1:statusCode/@code='completed']/n1:value/@displayName)>1">
					<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN' and n1:statusCode/@code='completed']/n1:value/@displayName"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN' and n1:statusCode/@code='completed']/n1:value/@displayName)>1">
					<xsl:value-of select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN' and n1:statusCode/@code='completed']/n1:value/@displayName"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN' and n1:statusCode/@code='completed']/n1:value/@displayName)>1">
					<xsl:value-of select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN' and n1:statusCode/@code='completed']/n1:value/@displayName"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN']/n1:value/n1:originalText)>1">
					<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:observation[@classCode='OBS' and @moodCode='EVN']/n1:value/n1:originalText"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship/n1:observation/n1:value[@xsi:type='CE']/n1:originalText)>1">
					<xsl:value-of select="$substanceAdmin/n1:entryRelationship/n1:observation/n1:value[@xsi:type='CE']/n1:originalText"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship/n1:observation/n1:value[@xsi:type='CE']/@displayName)>1">
					<xsl:value-of select="$substanceAdmin/n1:entryRelationship/n1:observation/n1:value[@xsi:type='CE']/@displayName"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:statusCode/@code)>1">
					<xsl:value-of select="$substanceAdmin/n1:statusCode/@code"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getRxNumString">
	
		<xsl:param name="substanceAdmin"/>
		<xsl:if test="$substanceAdmin">
			<xsl:choose>
				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='EVN']/n1:id/@extension)>1">
					<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='EVN']/n1:id/@extension"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']//n1:id/@extension)>1">
					<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']//n1:id/@extension"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:supply[@moodCode='EVN' and @classCode='SPLY']/n1:id/@extension)>1">
					<xsl:value-of select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:supply[@moodCode='EVN' and @classCode='SPLY']/n1:id/@extension"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getMedProvider">
		<xsl:param name="substanceAdmin"/>
		<xsl:variable name="assignedPerson1" select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson"/>
		<xsl:variable name="assignedPerson2" select="$substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson"/>
		<xsl:variable name="assignedPerson3" select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson"/>
		<xsl:variable name="assignedPerson4" select="$substanceAdmin/n1:author/n1:assignedAuthor/n1:assignedPerson"/>
		<xsl:if test="$substanceAdmin">

			<xsl:choose>

				<xsl:when test="string-length($assignedPerson1/n1:name)>1">
					<xsl:choose>
						<xsl:when test="$assignedPerson1/n1:name/n1:given and $assignedPerson1/n1:name/n1:family">
							<xsl:call-template name="formatProviderName">
								<xsl:with-param name="first" select="$assignedPerson1/n1:name/n1:given"/>
								<xsl:with-param name="last" select="$assignedPerson1/n1:name/n1:family"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$assignedPerson1/n1:name"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="string-length($assignedPerson4/n1:name)>1">
					<xsl:choose>
						<xsl:when test="$assignedPerson4/n1:name/n1:given and $assignedPerson4/n1:name/n1:family">
							<xsl:call-template name="formatProviderName">
								<xsl:with-param name="first" select="$assignedPerson4/n1:name/n1:given"/>
								<xsl:with-param name="last" select="$assignedPerson4/n1:name/n1:family"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$assignedPerson4/n1:name"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>

				<xsl:when test="string-length($substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name)>1">
					<xsl:choose>
						<xsl:when test="$assignedPerson2/n1:name/n1:given and $assignedPerson2/n1:name/n1:family">
							<xsl:call-template name="formatProviderName">
								<xsl:with-param name="first" select="$substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name/n1:given"/>
								<xsl:with-param name="last" select="$substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name/n1:family"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>

				<xsl:when test="string-length($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name)>1">
					<xsl:choose>
						<xsl:when test="$assignedPerson3/n1:name/n1:given and $assignedPerson3/n1:name/n1:family">
							<xsl:call-template name="formatProviderName">
								<xsl:with-param name="first" select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name/n1:given"/>
								<xsl:with-param name="last" select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name/n1:family"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getMedQuantityString">
		<xsl:param name="substanceAdmin"/>
		<xsl:if test="$substanceAdmin">
			<xsl:choose>
				<xsl:when test="string-length($substanceAdmin/n1:doseQuantity/@value)>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:doseQuantity/@value)"/>
				</xsl:when>
				<xsl:when test="string-length($substanceAdmin/n1:doseQuantity/n1:low/@value)>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:doseQuantity/n1:low/@value)" />
				</xsl:when>
				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:quantity/@value))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:quantity/@value)"/>
				</xsl:when>
				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:entryRelationship[@typeCode='COMP']/n1:supply[@classCode='SPLY' and @moodCode='EVN']/n1:quantity/@value))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:entryRelationship[@typeCode='COMP']/n1:supply[@classCode='SPLY' and @moodCode='EVN']/n1:quantity/@value)"/>
				</xsl:when>
				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:text))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:text)"/>
				</xsl:when>
				<xsl:when test="string-length(normalize-space($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply/n1:quantity/@value))>0">
					<xsl:value-of select="normalize-space($substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply/n1:quantity/@value)"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getSig">
		<xsl:param name="substanceAdmin"/>
<!--		
		<xsl:variable name="sigId1" select="$substanceAdmin/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:originalText/n1:reference/@value"/>
-->	
		<xsl:variable name="sigId1" select="$substanceAdmin//n1:reference/@value"/>	
		<xsl:variable name="sigId2" select="substring-after($sigId1,'#')"/>
		<xsl:variable name="result1">
			<xsl:call-template name="getSigWithKey">
				<xsl:with-param name="key" select="$sigId1"/>
				<xsl:with-param name="substanceAdmin" select="$substanceAdmin"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="string-length($result1)">
			<xsl:value-of select="$result1"/>
		</xsl:if>
		<xsl:call-template name="getSigWithKey">
			<xsl:with-param name="key" select="$sigId2"/>
			<xsl:with-param name="substanceAdmin" select="$substanceAdmin"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="getSigWithKey">
		<xsl:param name="substanceAdmin"/>
		<xsl:param name="key"/>
		<xsl:choose>
			<xsl:when test="string-length($substanceAdmin/../../n1:text//n1:content[@ID=$key])>0">
				<xsl:value-of select="normalize-space($substanceAdmin/../../n1:text//n1:content[@ID=$key])"/>
			</xsl:when>
			<xsl:when test="string-length($substanceAdmin/../../n1:text//n1:td[@ID=$key])>0">
				<xsl:value-of select="normalize-space($substanceAdmin/../../n1:text//n1:td[@ID=$key])"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getMedSource">
		<xsl:param name="substanceAdmin"/>
		<xsl:choose>
			<xsl:when test="$substanceAdmin/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="$substanceAdmin/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:when test="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="$substanceAdmin/n1:entryRelationship[@typeCode='REFR']/n1:supply[@classCode='SPLY' and @moodCode='INT']/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:when test="$substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:code/@displayName">
				<xsl:value-of select="$substanceAdmin/n1:entryRelationship/n1:supply/n1:author/n1:assignedAuthor/n1:code/@displayName"/>
			</xsl:when>
			<xsl:when test="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Problems -->

	<xsl:template name="probName">
		<xsl:param name="probEntry"/>
		<xsl:variable name="path" select="$probEntry/.."/>
		<xsl:variable name="probReference1" select="$probEntry/n1:act/n1:entryRelationship/n1:observation/n1:text/n1:reference/@value"/>
		<xsl:variable name="probReference2" select="substring-after($probReference1,'#')"/>
		<xsl:choose>
            <xsl:when test="($probEntry/n1:act/n1:entryRelationship/n1:observation/n1:value/@displayName) and ($isMultiCare)">
                <xsl:value-of select="$probEntry/n1:act/n1:entryRelationship/n1:observation/n1:value/@displayName"/>
            </xsl:when>
			<xsl:when test="$path/n1:text//n1:content[@ID=$probReference1]">
				<xsl:value-of select="$path/n1:text//n1:content[@ID=$probReference1]"/>
			</xsl:when>
			<xsl:when test="$path/n1:text//n1:content[@ID=$probReference2]">
				<xsl:value-of select="$path/n1:text//n1:content[@ID=$probReference2]"/>
			</xsl:when>
			<xsl:when test="$path/n1:text//n1:paragraph[@ID=$probReference1]">
				<xsl:value-of select="$path/n1:text//n1:paragraph[@ID=$probReference1]"/>
			</xsl:when>
			<xsl:when test="$path/n1:text//n1:paragraph[@ID=$probReference2]">
				<xsl:value-of select="$path/n1:text//n1:paragraph[@ID=$probReference2]"/>
			</xsl:when>
			<xsl:when test="$path/n1:text//n1:td[@ID=$probReference1]">
				<xsl:value-of select="$path/n1:text//n1:td[@ID=$probReference1]"/>
			</xsl:when>
			<xsl:when test="$path/n1:text//n1:td[@ID=$probReference2]">
				<xsl:value-of select="$path/n1:text//n1:td[@ID=$probReference2]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getProblemOnsetDateString">
		<xsl:param name="act"/>
		<xsl:if test="$act">
			<xsl:choose>
				<xsl:when test="string-length($act/n1:entryRelationship/n1:observation/n1:effectiveTime/n1:low/@value)>1">
					<xsl:value-of select="$act/n1:entryRelationship/n1:observation/n1:effectiveTime/n1:low/@value"/>
				</xsl:when>
				<xsl:when test="string-length($act/n1:effectiveTime/n1:low/@value)>1">
					<xsl:value-of select="n1:act/n1:effectiveTime/n1:low/@value"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getProblemCode">
		<xsl:param name="rowData"/>
		<xsl:choose>
			<xsl:when test="$rowData/n1:value/@code and not ($isDoD)">
				<xsl:value-of select="$rowData/n1:value/@code"/>
			</xsl:when>
			<xsl:when test="($rowData/n1:value/n1:translation/@code) and not($rowData/n1:value/n1:translation/@code='null')">
				<xsl:value-of select="$rowData/n1:value/n1:translation/@code"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getProblemSource">
		<xsl:param name="row"/>
		<xsl:choose>
			<xsl:when test="$row/n1:act/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="$row/n1:act/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name">
				<xsl:value-of select="$row/n1:act/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:entryRelationship/n1:observation/n1:participant/@typeCode = 'AUT'">
				<xsl:value-of select="$row/n1:act/n1:entryRelationship/n1:observation/n1:participant/n1:participantRole/n1:playingEntity/n1:desc"/>
			</xsl:when>
			<xsl:when test="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
				<xsl:value-of select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getProblemProvider">
		<xsl:param name="act"/>
		<xsl:choose>
			<xsl:when test="$act/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name">
				<xsl:variable name="name1">
					<xsl:call-template name="getPersonNameFromRoot">
						<xsl:with-param name="nameRoot" select="$act/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="string-length($name1)>0">
						<xsl:value-of select="$name1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="name2">
							<xsl:call-template name="getPersonNameFromRoot">
								<xsl:with-param name="nameRoot" select="$act/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name/n1:performer[@typeCode='PRF']/n1:assignedEntity/n1:assignedPerson/n1:name"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($name2)>0">
								<xsl:value-of select="$name2"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="name3">
									<xsl:call-template name="getPersonNameFromRoot">
										<xsl:with-param name="nameRoot" select="$act/n1:entryRelationship/n1:observation/n1:entryRelationship/n1:observation[@classCode='OBS' and @moodCode='EVN']/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="string-length($name3)>0">
										<xsl:value-of select="$name3"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="providerId" select="$act/n1:performer/n1:assignedEntity/n1:id/@extension"/>
										<xsl:variable name="name4">
											<xsl:call-template name="getPersonNameFromRoot">
												<xsl:with-param name="nameRoot" select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:id[@extension=$providerId]/../n1:assignedPerson/n1:name"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:choose>
											<xsl:when test="string-length($name4)>0">
												<xsl:value-of select="$name4"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:id[@extension=$providerId]/@assigningAuthorityName"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name and ($isMultiCare)">
				<xsl:variable name="name1a">
					<xsl:call-template name="getPersonNameFromRoot">
						<xsl:with-param name="nameRoot" select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="string-length($name1a)>0">
					<xsl:value-of select="$name1a"/>
				</xsl:if>
			</xsl:when>			
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>			
		</xsl:choose>		
	</xsl:template>

	<xsl:template name="getPersonNameFromRoot">
		<xsl:param name="nameRoot"/>
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($nameRoot/text()))>0">
				<xsl:value-of select="normalize-space($nameRoot/text())"/>
			</xsl:when>
			<xsl:when test="string-length($nameRoot/n1:family)>0 or string-length($nameRoot/n1:given)>0">
				<xsl:call-template name="getPersonName">
					<xsl:with-param name="nameRoot" select="$nameRoot"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getPersonName">
		<xsl:param name="nameRoot"/>
		<xsl:value-of select="$nameRoot/n1:family"/>
		<xsl:if test="string-length($nameRoot/n1:given)>0">
			<xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:for-each select="$nameRoot/n1:given">
			<xsl:text> </xsl:text>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<!-- Labs -->

	<xsl:template name="getPanelDT">
		<xsl:param name="organizer"/>
		<xsl:if test="$organizer">
			<xsl:choose>
				<xsl:when test="$organizer/n1:effectiveTime/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$organizer/n1:effectiveTime/@value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$organizer/n1:effectiveTime/n1:low/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$organizer/n1:effectiveTime/n1:low/@value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$organizer/n1:component/n1:procedure/n1:effectiveTime/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$organizer/n1:component/n1:procedure/n1:effectiveTime/@value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$organizer/n1:component/n1:procedure/n1:effectiveTime/n1:low/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$organizer/n1:component/n1:procedure/n1:effectiveTime/n1:low/@value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getResultDT">
		<xsl:param name="observation"/>
		<xsl:if test="$observation">
			<xsl:choose>
				<xsl:when test="$observation/n1:effectiveTime/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$observation/n1:effectiveTime/@value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$observation/n1:effectiveTime/n1:low/@value">
					<xsl:call-template name="formatDateShort">
						<xsl:with-param name="dateString" select="$observation/n1:effectiveTime/n1:low/@value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getOrganizerName">
		<xsl:param name="row"/>
		<xsl:choose>
			<xsl:when test="count($row/n1:organizer/n1:component/n1:observation)=1 and $row/n1:organizer/n1:component/n1:observation/n1:code/@displayName">
				<xsl:choose>
					<xsl:when test="$row/n1:organizer/n1:component/n1:observation/n1:code/n1:translation/@displayName">
						<xsl:value-of select="$row/n1:organizer/n1:component/n1:observation/n1:code/n1:translation/@displayName"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$row/n1:organizer/n1:component/n1:observation/n1:code/@displayName"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$row/n1:component/n1:observation"/>
			</xsl:when>
			<xsl:when test="string-length($row/n1:organizer/n1:code/@displayName)">
				<xsl:value-of select="$row/n1:organizer/n1:code/@displayName"/>
			</xsl:when>
			<xsl:when test="string-length($row/n1:organizer/n1:code/n1:originalText)">
				<xsl:value-of select="$row/n1:organizer/n1:code/n1:originalText"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getResultType">
		<xsl:param name="observation"/>
		<xsl:choose>
			<xsl:when test="$observation/n1:code/n1:originalText">
				<xsl:value-of select="$observation/n1:code/n1:originalText"/>
			</xsl:when>
			<xsl:when test="$observation/n1:code/@displayName">
				<xsl:value-of select="$observation/n1:code/@displayName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="0"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getResultType2">
		<xsl:param name="observation"/>
		<xsl:choose>
			<xsl:when test="$observation/n1:code/n1:originalText/n1:reference/@value">
				<xsl:call-template name="getResultTypeFromReference">
					<xsl:with-param name="resultTypeReference" select="$observation/n1:code/n1:originalText/n1:reference/@value"/>
					<xsl:with-param name="section" select="$observation/../../../../."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$observation/n1:code/@displayName">
				<xsl:value-of select="$observation/n1:code/@displayName"/>
			</xsl:when>
			<xsl:when test="$observation/n1:text/n1:reference/@value">
				<xsl:call-template name="getResultTypeFromReference">
					<xsl:with-param name="resultTypeReference" select="$observation/n1:text/n1:reference/@value"/>
					<xsl:with-param name="section" select="$observation/../../../../."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="getResultTypeFromReference">
		<xsl:param name="resultTypeReference"/>
		<xsl:param name="section"/>
		<xsl:variable name="resultTypeValue" select="$section//n1:content[@ID=$resultTypeReference]"/>
		<xsl:variable name="resultTypeValue2" select="$section//n1:content[@ID=substring-after($resultTypeReference,'#')]"/>
		<xsl:variable name="resultTypeValue3" select="$section/n1:text//n1:td[@ID=$resultTypeReference]"/>
		<xsl:variable name="resultTypeValue4" select="$section/n1:text//n1:td[@ID=substring-after($resultTypeReference,'#')]"/>
		<xsl:if test="string-length($resultTypeValue)>1">
			<xsl:value-of select="$resultTypeValue"/>
		</xsl:if>
		<xsl:if test="string-length($resultTypeValue2)>1">
			<xsl:value-of select="$resultTypeValue2"/>
		</xsl:if>
		<xsl:if test="string-length($resultTypeValue3)>1">
			<xsl:value-of select="$resultTypeValue3"/>
		</xsl:if>
		<xsl:if test="string-length($resultTypeValue4)>1">
			<xsl:value-of select="$resultTypeValue4"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getResultValue">
		<xsl:param name="observation"/>
		<xsl:if test="$observation">
			<xsl:choose>
				<xsl:when test="$observation/n1:value/@value">
					<xsl:value-of select="$observation/n1:value/@value"/>
					<xsl:if test="$observation/n1:value/@unit">
						<xsl:text> </xsl:text>
						<xsl:value-of select="$observation/n1:value/@unit"/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$observation/n1:value[@xsi:type='ST']">
					<xsl:value-of select="$observation/n1:value[@xsi:type='ST']"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="getInterpretation">
		<xsl:param name="observation"/>
		<xsl:choose>
			<xsl:when test="$observation/n1:interpretationCode/@displayName">
				<xsl:value-of select="$observation/n1:interpretationCode/@displayName"/>
			</xsl:when>
			<xsl:when test="$observation/n1:interpretationCode/n1:originalText">
				<xsl:value-of select="$observation/n1:interpretationCode/n1:originalText"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getInterpretation2">
		<xsl:param name="observation"/>
		<xsl:choose>
			<xsl:when test="$observation/n1:interpretationCode/n1:originalText/n1:reference/@value">
				<xsl:call-template name="getInterpretationFromReference">
					<xsl:with-param name="interpretationReference" select="$observation/n1:interpretationCode/n1:code/n1:originalText/n1:reference/@value"/>
					<xsl:with-param name="section" select="$observation/n1:interpretationCode/../../../../../."/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getInterpretationFromReference">
		<xsl:param name="interpretationReference"/>
		<xsl:param name="section"/>
		<xsl:variable name="interpretationValue" select="$section//n1:content[@ID=$interpretationReference]"/>
		<xsl:variable name="interpretationValue2" select="$section//n1:content[@ID=substring-after($interpretationReference,'#')]"/>
		<xsl:variable name="interpretationValue3" select="$section/n1:text//n1:td[@ID=$interpretationReference]"/>
		<xsl:variable name="interpretationValue4" select="$section/n1:text//n1:td[@ID=substring-after($interpretationReference,'#')]"/>
		<xsl:if test="string-length($interpretationValue)>1">
			<xsl:value-of select="$interpretationValue"/>
		</xsl:if>
		<xsl:if test="string-length($interpretationValue2)>1">
			<xsl:value-of select="$interpretationValue2"/>
		</xsl:if>
		<xsl:if test="string-length($interpretationValue3)>1">
			<xsl:value-of select="$interpretationValue3"/>
		</xsl:if>
		<xsl:if test="string-length($interpretationValue4)>1">
			<xsl:value-of select="$interpretationValue4"/>
		</xsl:if>
	</xsl:template>


	<xsl:template name="getRefRange">
		<xsl:param name="observation"/>
		<xsl:choose>
			<xsl:when test="$observation/n1:referenceRange/n1:observationRange/n1:text">
				<xsl:value-of select="$observation/n1:referenceRange/n1:observationRange/n1:text"/>
			</xsl:when>
			<xsl:when test="$observation/n1:referenceRange/n1:observationRange/n1:value/n1:low/@value and $observation/n1:referenceRange/n1:observationRange/n1:value/n1:high/@value">
				<xsl:value-of select="$observation/n1:referenceRange/n1:observationRange/n1:value/n1:low/@value"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="$observation/n1:referenceRange/n1:observationRange/n1:value/n1:high/@value"/>
				<xsl:text>  </xsl:text>
				<xsl:value-of select="$observation/n1:referenceRange/n1:observationRange/n1:value/n1:high/@unit"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>

	<!-- Immunizations -->

	<xsl:template name="getImmunization">
		<xsl:param name="substanceAdministration"/>
		<xsl:choose>
			<xsl:when test="$substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:originalText/n1:reference/@value">
				<xsl:call-template name="getImmunizationFromReference">
					<xsl:with-param name="immunizationReference" select="$substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:originalText/n1:reference/@value"/>
					<xsl:with-param name="section" select="$substanceAdministration/../../."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getImmunizationFromReference">
		<xsl:param name="immunizationReference"/>
		<xsl:param name="section"/>
		<xsl:variable name="immunizationValue" select="$section//n1:content[@ID=$immunizationReference]"/>
		<xsl:variable name="immunizationValue2" select="$section//n1:content[@ID=substring-after($immunizationReference,'#')]"/>
		<xsl:variable name="immunizationValue3" select="$section/n1:text//n1:td[@ID=$immunizationReference]"/>
		<xsl:variable name="immunizationValue4" select="$section/n1:text//n1:td[@ID=substring-after($immunizationReference,'#')]"/>
		<xsl:if test="string-length($immunizationValue)>1">
			<xsl:value-of select="$immunizationValue"/>
		</xsl:if>
		<xsl:if test="string-length($immunizationValue2)>1">
			<xsl:value-of select="$immunizationValue2"/>
		</xsl:if>
		<xsl:if test="string-length($immunizationValue3)>1">
			<xsl:value-of select="$immunizationValue3"/>
		</xsl:if>
		<xsl:if test="string-length($immunizationValue4)>1">
			<xsl:value-of select="$immunizationValue4"/>
		</xsl:if>
	</xsl:template>

	<!-- End domain templates -->


	<!--  Comments Section-->

	<xsl:template name="getCommonFormatComments">
		<xsl:variable name="ref1" select="n1:entry/n1:act/n1:text/n1:reference/@value"/>
		<xsl:variable name="ref2" select="substring-after($ref1,'#')"/>
		<xsl:choose>
			<xsl:when test="n1:text//n1:content[@ID=$ref1]">
				<xsl:call-template name="formatComments">
					<xsl:with-param name="comments" select="n1:text//n1:content[@ID=$ref1]"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="n1:text//n1:content[@ID=$ref2]">
				<xsl:call-template name="formatComments">
					<xsl:with-param name="comments" select="n1:text//n1:content[@ID=$ref2]"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- Encounters Comments-->

	<!-- Encounters Notice (Comments field)-->
	<xsl:template name="encounterNotice">
		<div>
			<table class="comments">
				<tbody>
					<tr>
						<td>
							<img src="resources/images/comments_notice.jpg" alt="NOTE:"/>
							<text style="line-height:10%">
								<b> NOTE: Click on the Encounter Comments field to display/hide additional data where applicable</b>
							</text>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
		</div>
	</xsl:template>


	<!-- Procedures Comments-->

	<!-- Procedures Notice (Comments field)-->
	<xsl:template name="proceduresNotice">
		<div>
			<table class="comments">
				<tbody>
					<tr>
						<td>
							<img src="resources/images/comments_notice.jpg" alt="NOTE:"/>
							<text>
								<b> NOTE: Click on the Procedure Comments field to display/hide additional data where applicable</b>
							</text>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
		</div>
	</xsl:template>


	<!-- Miscellaneous -->
	<!--<xsl:template name="na">
		<span title="Not Available">
			<xsl:text>  </xsl:text>
		</span>
	</xsl:template>-->

	<xsl:template name="noData">
		<span style="font-weight:bold;">
			<xsl:text disable-output-escaping="yes">    </xsl:text>
			<img src="resources/images/notice.jpg" alt="Notice"/>
			<xsl:text disable-output-escaping="yes">      No Data Found</xsl:text>
		</span>
		<br />
		<br />
	</xsl:template>

	<xsl:template name="shortenDate">
		<xsl:param name="inString"/>
		<xsl:choose>
			<xsl:when test="substring($inString,9,1)='.'">
				<xsl:value-of select="substring($inString,1,15)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($inString,1,14)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getLoincStatusCode">
		<xsl:param name="entry"/>
		<xsl:if test="$entry">
			<xsl:choose>
				<xsl:when test="string-length($entry//n1:entryRelationship/n1:observation[n1:code[@code='33999-4' and @codeSystem='2.16.840.1.113883.6.1']]/n1:value/n1:originalText)>0">
					<xsl:value-of select="$entry//n1:entryRelationship/n1:observation[n1:code[@code='33999-4' and @codeSystem='2.16.840.1.113883.6.1']]/n1:value/n1:originalText"/>
				</xsl:when>
				<xsl:when test="string-length($entry//n1:entryRelationship/n1:observation[n1:code[@code='33999-4' and @codeSystem='2.16.840.1.113883.6.1']]/n1:value/@displayName)">
					<xsl:value-of select="$entry//n1:entryRelationship/n1:observation[n1:code[@code='33999-4' and @codeSystem='2.16.840.1.113883.6.1']]/n1:value/@displayName"/>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
    
    <!-- from common.xsl -->
    
	<xsl:template name="formatDateLongFromVista">
		<!-- VistA dates are in the format 3090421.123545 -->
		<xsl:param name="dateString"/>
		<xsl:variable name="month" select="substring($dateString,4,2)"/>
		<xsl:call-template name="longMonth">
			<xsl:with-param name="monthNum" select="$month"/>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test='substring($dateString, 6, 1)="0"'>
				<xsl:value-of select="substring($dateString, 7, 1)"/>
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($dateString, 6, 2)"/>
				<xsl:text>, </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="17+number(substring($dateString, 1, 1))"/><xsl:value-of select="substring($dateString, 2, 2)"/>
	</xsl:template>

	<xsl:template name="longMonth">
		<xsl:param name="monthNum"/>
		<xsl:choose>
			<xsl:when test="$monthNum='01'">
				<xsl:text>January </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='02'">
				<xsl:text>February </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='03'">
				<xsl:text>March </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='04'">
				<xsl:text>April </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='05'">
				<xsl:text>May </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='06'">
				<xsl:text>June </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='07'">
				<xsl:text>July </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='08'">
				<xsl:text>August </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='09'">
				<xsl:text>September </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='10'">
				<xsl:text>October </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='11'">
				<xsl:text>November </xsl:text>
			</xsl:when>
			<xsl:when test="$monthNum='12'">
				<xsl:text>December </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>(Unknown Month:</xsl:text><xsl:value-of select="$monthNum"/><xsl:text>:) </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="shortMonth">
		<xsl:param name="month"/>
		<xsl:choose>
			<xsl:when test="$month='01'">
				<xsl:text>Jan </xsl:text>
			</xsl:when>
			<xsl:when test="$month='02'">
				<xsl:text>Feb </xsl:text>
			</xsl:when>
			<xsl:when test="$month='03'">
				<xsl:text>Mar </xsl:text>
			</xsl:when>
			<xsl:when test="$month='04'">
				<xsl:text>Apr </xsl:text>
			</xsl:when>
			<xsl:when test="$month='05'">
				<xsl:text>May </xsl:text>
			</xsl:when>
			<xsl:when test="$month='06'">
				<xsl:text>Jun </xsl:text>
			</xsl:when>
			<xsl:when test="$month='07'">
				<xsl:text>Jul </xsl:text>
			</xsl:when>
			<xsl:when test="$month='08'">
				<xsl:text>Aug </xsl:text>
			</xsl:when>
			<xsl:when test="$month='09'">
				<xsl:text>Sep </xsl:text>
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:text>Oct </xsl:text>
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:text>Nov </xsl:text>
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:text>Dec </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="formatDateLongFromUtc">
		<xsl:param name="dateString"/>
		<xsl:variable name="month" select="substring($dateString,5,2)"/>
		<xsl:call-template name="longMonth">
			<xsl:with-param name="monthNum" select="$month"/>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test='substring($dateString, 7, 1)="0"'>
				<xsl:value-of select="substring($dateString, 8, 1)"/>
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($dateString, 7, 2)"/>
				<xsl:text>, </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="substring($dateString, 1, 4)"/>
	</xsl:template>

	<xsl:template name="formatDateLong">
		<xsl:param name="dateString"/>
		<xsl:choose>
			<xsl:when test="$dateString='0'"></xsl:when>
			<xsl:when test="string-length($dateString)=0"></xsl:when>
			<xsl:when test="substring($dateString, 8, 1)='.'">
				<xsl:call-template name="formatDateLongFromVista"><xsl:with-param name="dateString" select="$dateString"/></xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateLongFromUtc">
					<xsl:with-param name="dateString" select="$dateString"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="formatDateShort">
		<xsl:param name="dateString"/>
		<xsl:choose>
			<xsl:when test="$dateString='0'"></xsl:when>
			<xsl:when test="string-length($dateString)=0"></xsl:when>
			<xsl:when test="substring($dateString, 8, 1)='.'">
				<xsl:call-template name="formatDateShortFromVista">
					<xsl:with-param name="dateString" select="$dateString"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateShortFromUtc">
					<xsl:with-param name="dateString" select="$dateString"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="formatDateShortFromVista">
		<xsl:param name="dateString"/>
		<xsl:choose>
			<xsl:when test='substring($dateString, 6, 1)="0"'>
				<xsl:value-of select="substring($dateString, 7, 1)"/>
                <xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($dateString, 6, 2)"/>
			</xsl:otherwise>
            <xsl:text> </xsl:text>
		</xsl:choose>
        <xsl:variable name="month" select="substring($dateString,4,2)"/>
		<xsl:call-template name="shortMonth">
			<xsl:with-param name="month" select="$month"/>
		</xsl:call-template>
		<xsl:value-of select="17+number(substring($dateString, 1, 1))"/>
		<xsl:value-of select="substring($dateString, 2, 2)"/>
	</xsl:template>
	
	<xsl:template name="formatDateShortFromUtc">
		<xsl:param name="dateString"/>
		<xsl:choose>
			<xsl:when test='substring($dateString, 7, 1)="0"'>
				<xsl:value-of select="substring($dateString, 7, 2)"/>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring($dateString, 7, 2)"/>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
        <xsl:variable name="month" select="substring($dateString,5,2)"/>
		<xsl:call-template name="shortMonth">
			<xsl:with-param name="month" select="$month"/>
		</xsl:call-template>
		<xsl:value-of select="substring($dateString, 1, 4)"/>
	</xsl:template>

	<xsl:template name="formatDateNumeric">
		<xsl:param name="dateString"/>
		<xsl:choose>
			<xsl:when test="$dateString='0'"></xsl:when>
			<xsl:when test="substring($dateString, 8, 1)='.' or string-length($dateString)=7">
				<xsl:call-template name="formatDateNumericFromVista">
					<xsl:with-param name="dateString" select="$dateString"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="substring($dateString, 9, 1)='.'">
				<xsl:call-template name="formatDateNumericFromMdo">
					<xsl:with-param name="dateString" select="$dateString"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateNumericFromUtc">
					<xsl:with-param name="dateString" select="$dateString"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="formatDateNumericFromMdo">
		<xsl:param name="dateString"/>
		<xsl:variable name="dateValue">
			<xsl:value-of select="$dateString"/>
			<xsl:text>000000</xsl:text>
		</xsl:variable>
		<xsl:value-of select="substring($dateValue, 5, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($dateValue, 7, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($dateValue, 1, 4)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateValue, 10, 2)"/>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="substring($dateValue, 12, 2)"/>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="substring($dateValue, 14, 2)"/>
	</xsl:template>

	<xsl:template name="formatDateNumericFromVista">
		<xsl:param name="dateString"/>
		<xsl:value-of select="substring($dateString, 4, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($dateString, 6, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="17+number(substring($dateString, 1, 1))"/>
		<xsl:value-of select="substring($dateString, 2, 2)"/>
		<xsl:if test="string-length($dateString)>7">
			<xsl:variable name="dateValue">
				<xsl:value-of select="$dateString"/>
				<xsl:text>000000</xsl:text>
			</xsl:variable>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring($dateValue, 9, 2)"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="substring($dateValue, 11, 2)"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="substring($dateValue, 13, 2)"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="formatDateNumericFromUtc">
		<xsl:param name="dateString"/>
		<xsl:value-of select="substring($dateString, 5, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($dateString, 7, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($dateString, 1, 4)"/>
		<xsl:if test="string-length($dateString)>8">
			<xsl:variable name="dateValue">
				<xsl:value-of select="$dateString"/>
				<xsl:text>000000</xsl:text>
			</xsl:variable>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring($dateValue, 9, 2)"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="substring($dateValue, 11, 2)"/>
			<xsl:if test="string-length($dateValue)>14">
				<xsl:if test="substring($dateValue,15,1)='-' or substring($dateValue,15,1)='+'">
					<xsl:text>:</xsl:text>
					<xsl:value-of select="substring($dateValue, 13, 2)"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template name="ltrim">
		<xsl:param name="text"/>
		<xsl:param name="startChar" select="' '"/>
		<xsl:if test="$text">
			<xsl:choose>
				<xsl:when test="starts-with($text,$startChar)">
					<xsl:call-template name="ltrim">
						<xsl:with-param name="text" select="substring-after($text,$startChar)"/>
						<xsl:with-param name="startChar" select="$startChar"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$text"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!-- from detailCommon.xsl -->

  <xsl:variable name="snomedCode">2.16.840.1.113883.6.96</xsl:variable>
  <xsl:variable name="snomedProblemCode">55607006</xsl:variable>
  <xsl:variable name="snomedProblemCode2">404684003</xsl:variable>
  <xsl:variable name="snomedProblemCode3">418799008</xsl:variable>
  <xsl:variable name="snomedAllergyCode">416098002</xsl:variable>

  <xsl:variable name="loincCode">2.16.840.1.113883.6.1</xsl:variable>
  <xsl:variable name="loincProblemCode">11450-4</xsl:variable>
  <xsl:variable name="loincAllergyCode">48765-2</xsl:variable>
  <xsl:variable name="loincMedCode">10160-0</xsl:variable>
  <xsl:variable name="loincEncounterCode">46240-8</xsl:variable>
  <xsl:variable name="loincResultsCode">30954-2</xsl:variable>
  <xsl:variable name="loincProceduresCode">47519-4</xsl:variable>
  <xsl:variable name="loincImmunizationsCode">11369-6</xsl:variable>
  <xsl:variable name="loincVitalsCode">8716-3</xsl:variable>

  <!-- vitals -->
  <xsl:variable name="loincTemperature">8310-5</xsl:variable>
  <xsl:variable name="loincHeight">8302-2</xsl:variable>
  <xsl:variable name="loincWeight">3141-9</xsl:variable>
  <xsl:variable name="loincPulse">8867-4</xsl:variable>
  <xsl:variable name="loincRespiration">9279-1</xsl:variable>
  <xsl:variable name="loincPulseOximetry">2710-2</xsl:variable>
  <xsl:variable name="loincBloodGlucose">2339-0</xsl:variable>
  <xsl:variable name="loincBloodPressure">55284-4</xsl:variable>
  <xsl:variable name="loincBmi1">39156-5</xsl:variable>
  <xsl:variable name="loincBmi2">41909-3</xsl:variable>
  <xsl:variable name="loincCentralVenousPressure">8591-0</xsl:variable>
  <xsl:variable name="loincCircGirth">8280-0</xsl:variable>
  <xsl:variable name="loincFlowRate">3151-8</xsl:variable>
  <xsl:variable name="loincO2Concentration">3150-0</xsl:variable>
  <xsl:variable name="loincPain">32419-4</xsl:variable>
  <xsl:variable name="loincBpSystolic">8480-6</xsl:variable>
  <xsl:variable name="loincBpDiastolic">8462-4</xsl:variable>
  <xsl:variable name="loincBodyHtLying">8306-3</xsl:variable>
  <xsl:variable name="loincOCF">8287-5</xsl:variable>
  <xsl:variable name="loincWeight2">29463-7</xsl:variable>

  <xsl:variable name="vitalsTemplateCode">2.16.840.1.113883.10.20.1.32</xsl:variable>
  <xsl:variable name="labsTemplateCode">2.16.840.1.113883.10.20.1.32</xsl:variable>
  <xsl:variable name="immunizationsTemplateCode">2.16.840.1.113883.10.20.1.32</xsl:variable>
  <xsl:variable name="allergyTemplateCode">2.16.840.1.113883.10.20.1.18</xsl:variable>
  <xsl:variable name="problemTemplateCode">2.16.840.1.113883.10.20.1.28</xsl:variable>

  <xsl:variable name="row">"ClinicalDocument/"</xsl:variable>

  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="string-length(/n1:ClinicalDocument/n1:title)=0">
        <xsl:text>Clinical Document</xsl:text>
      </xsl:when>
      <xsl:when test="/n1:ClinicalDocument/n1:title">
        <xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <xsl:template name="facilityName">
    <xsl:value-of select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
  </xsl:template>

  <xsl:template name="getLocationName">
    <xsl:param name="organizer"/>
    <xsl:choose>
      <xsl:when test="$organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name">
        <xsl:value-of select="$organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
      </xsl:when>
      <xsl:when test="$organizer/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name">
        <xsl:value-of select="$organizer/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- Medications -->

  <xsl:template name="medStatus">
    <xsl:param name="substanceAdmin"/>
    <xsl:variable name="status">
      <xsl:call-template name="getMedStatusString">
        <xsl:with-param name="substanceAdmin" select="$substanceAdmin"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($status)&gt;0">
        <xsl:value-of select="$status"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="medQuantity">
    <xsl:param name="substanceAdmin"/>
    <xsl:variable name="qtyString">
      <xsl:call-template name="getMedQuantityString">
        <xsl:with-param name="substanceAdmin" select="$substanceAdmin"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($qtyString)>0">
        <xsl:value-of select="$qtyString"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="medBegintime">
    <xsl:param name="row"/>
    <xsl:variable name="medBeginString">
      <xsl:call-template name="medDateBeginString">
        <xsl:with-param name="substanceAdmin" select="$row/n1:substanceAdministration"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($medBeginString)&gt;1">
        <xsl:call-template name="formatDateShort">
          <xsl:with-param name="dateString" select="$medBeginString"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="medExpiretime">
    <xsl:param name="substanceAdmin"/>
    <xsl:variable name="medExpireString">
      <xsl:call-template name="medExpireDateString">
        <xsl:with-param name="substanceAdmin" select="$substanceAdmin"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($medExpireString)>1">
        <xsl:call-template name="formatDateShort">
          <xsl:with-param name="dateString" select="$medExpireString"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Problems -->

	<xsl:template name="probStatus">
		<xsl:param name="row"/>
		<xsl:variable name="loincStatus">
			<xsl:call-template name="getLoincStatusCode">
				<xsl:with-param name="entry" select="$row"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($loincStatus)>0">
				<xsl:value-of select="$loincStatus"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:entryRelationship [@typeCode='SUBJ']/n1:observation [@moodCode='EVN'] [@classCode='OBS']/n1:statusCode/@code">
				<xsl:value-of select="$row/n1:act/n1:entryRelationship [@typeCode='SUBJ']/n1:observation [@moodCode='EVN'] [@classCode='OBS']/n1:statusCode/@code"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:entryRelationship[@typeCode='REFR']/n1:observation/n1:value/@displayName">
				<xsl:value-of select="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:entryRelationship[@typeCode='REFR']/n1:observation/n1:value/@displayName"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:entryRelationship[@typeCode='REFR']/n1:observation/n1:value/@displayName">
				<xsl:value-of select="$row/n1:act/n1:entryRelationship[@typeCode='REFR']/n1:observation/n1:value/@displayName"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:value/@displayName">
				<xsl:value-of select="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:value/@displayName"/>
			</xsl:when>
			<xsl:when test="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:statusCode/@code">
				<xsl:value-of select="$row/n1:act/n1:entryRelationship[@typeCode='SUBJ']/n1:observation/n1:statusCode/@code"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="dcna"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

  <xsl:template name="probDate">
    <xsl:param name="row"/>
    <xsl:variable name="rawDate">
      <xsl:call-template name="getProblemOnsetDateString">
        <xsl:with-param name="act" select="$row/n1:act"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($rawDate)>1">
        <xsl:call-template name="formatDateShort">
          <xsl:with-param name="dateString" select="$rawDate"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Allergies -->

  <xsl:template name="allergyType">
    <xsl:param name="observation"/>
    <xsl:choose>
      <xsl:when test="$observation/n1:code/@displayName and not ($isKaiser)">
        <xsl:value-of select="$observation/n1:code/@displayName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getReactionString">
    <xsl:param name="entry"/>
    <xsl:variable name="path" select="$entry/.."/>
    <xsl:for-each select="$entry/n1:act/n1:entryRelationship[@typeCode='MFST']">
      <xsl:variable name="reactionReference" select="n1:observation/n1:text/n1:reference/@value"/>
      <xsl:variable name="reactionValue" select="$path/n1:text//n1:content[@ID=$reactionReference]"/>
      <xsl:variable name="reactionValue2" select="$path/n1:text//n1:content[@ID=substring-after($reactionReference,'#')]"/>
      <xsl:if test="string-length($reactionValue)>1 and not($isKaiser)">
        <xsl:if test="position()>1">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:value-of select="$reactionValue"/>
      </xsl:if>
      <xsl:if test="string-length($reactionValue2)>1">
        <xsl:if test="position()>1">
          <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:value-of select="$reactionValue2"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="getSeverityText">
    <xsl:param name="observation"/>
    <xsl:if test="$observation">
      <xsl:variable name="sevrReference" select="substring-after($observation/n1:entryRelationship/n1:observation/n1:entryRelationship/n1:observation/n1:text/n1:reference/@value,'#')"/>
      <xsl:variable name="severity" select="$observation/../../../../n1:text//n1:content[@ID=$sevrReference]"/>
      <xsl:if test="string-length($severity)>1">
        <xsl:value-of select="$severity"/>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getCreatedOnDate">
    <xsl:choose>
      <xsl:when test="string-length(/n1:ClinicalDocument/n1:effectiveTime/@value)=0">
        <xsl:call-template name="dcna"/>
      </xsl:when>
      <xsl:when test="starts-with(/n1:ClinicalDocument/n1:effectiveTime/@value,' ')">
        <xsl:call-template name="dcna"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="formatDateShort">
          <xsl:with-param name="dateString" select="/n1:ClinicalDocument/n1:effectiveTime/@value"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getGenderString">
    <xsl:choose>
      <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code">
        <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="genderString">
          <xsl:with-param name="sex" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/n1:originalText"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Labs -->

  <xsl:template name="getResultValue_detail">
    <xsl:param name="observation"/>
    <xsl:if test="$observation">
      <xsl:choose>
        <xsl:when test="$observation/n1:value/@value">
          <xsl:value-of select="$observation/n1:value/@value"/>
        </xsl:when>
        <xsl:when test="$observation/n1:value[@xsi:type='ST']">
          <xsl:value-of select="$observation/n1:value[@xsi:type='ST']"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="dcna"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getResultValueDetail">
    <xsl:param name="observation"/>
    <xsl:if test="$observation">
      <xsl:choose>
        <xsl:when test="$observation/n1:value/@value">
          <xsl:value-of select="$observation/n1:value/@value"/>
          <xsl:if test="$observation/n1:value/@unit">
            <xsl:text> </xsl:text>
            <xsl:value-of select="$observation/n1:value/@unit"/>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="dcna"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getFlag">
    <xsl:param name="interpretation"/>
    <xsl:choose>
      <xsl:when test="$interpretation/@displayName">
        <xsl:value-of select="$interpretation/@displayName"/>
      </xsl:when>
      <xsl:when test="$interpretation/n1:originalText">
        <xsl:value-of select="$interpretation/n1:originalText"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>



  <xsl:template name="getResultUnit">
    <xsl:param name="observation"/>
    <xsl:choose>
      <xsl:when test="$observation/n1:value/@unit">
      	<xsl:choose>
      	  <xsl:when test="$observation/n1:value/@unit=$notAvailable">
            <xsl:call-template name="dcna"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$observation/n1:value/@unit"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$isKaiser">
        <xsl:text></xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getResultRefRange">
    <xsl:param name="observation"/>
    <xsl:choose>
      <xsl:when test="$observation/n1:referenceRange/n1:observationRange/n1:text">
        <xsl:value-of select="$observation/n1:referenceRange/n1:observationRange/n1:text"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--Determine if supported component(s) -->
  <xsl:template name="componentFound">
    <xsl:param name="compSection"/>
    <xsl:choose>
      <xsl:when test="$compSection/n1:code[@code=$loincAllergyCode]">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincEncounterCode]">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincImmunizationsCode]">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincMedCode] and not($noMed)">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincProblemCode] and not($noMdoProb)">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincProceduresCode]">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincResultsCode] and not($noMdoResult)">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:when test="$compSection/n1:code[@code=$loincVitalsCode]">
        <xsl:value-of select="$compSection/n1:code/@code"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="dcna">
    <xsl:text>--</xsl:text>
  </xsl:template>

  <xsl:template name="replaceSquigglesWithLinefeeds">
    <xsl:param name="text"/>
    <xsl:if test="$text">
      <xsl:choose>
        <xsl:when test="contains($text,'~')">
          <xsl:value-of select="substring-before($text,'~')"/>
          <xsl:text>&#13;&#10;</xsl:text>
          <xsl:call-template name="replaceSquigglesWithLinefeeds">
            <xsl:with-param name="text" select="substring-after($text,'~')"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$text"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="displayAllergyVerificationDate">
    <xsl:param name="observation"/>
    <xsl:variable name="allergyVerifDate">
      <xsl:call-template name="getAllergyVerificationDate">
        <xsl:with-param name="observation" select="$observation"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($allergyVerifDate)>0">
        <xsl:variable name="formattedVerifDate">
          <xsl:call-template name="formatDateShort">
            <xsl:with-param name="dateString" select="$allergyVerifDate"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$formattedVerifDate"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dcna"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  
  <!-- from cda2detailCommon.xslt-->
  <xsl:template match="/">
  		<xsl:apply-templates select="n1:ClinicalDocument"/>
	</xsl:template>


	<xsl:template match="n1:ClinicalDocument">
    	<html>
		<xsl:call-template name="displaySource"/>
        <div class="landscapePage">
		<xsl:call-template name="displayTitle"/>
		<xsl:call-template name="displayReportDates"/>
		<xsl:call-template name="displayPatientBlock"/>
		<xsl:call-template name="displayAuthorBlock"/>
		<xsl:call-template name="displayTableOfContents"/>
        </div>
        <div class="landscapePage">
		<xsl:call-template name="displayContents"/>
        </div>
		<div class="landscapePage">
		<xsl:call-template name="displayEmergencyContactBlock"/>
		<xsl:call-template name="displayBottomLine"/>
		</div>
        </html>
	</xsl:template>

	<!-- Templates to be overridden -->
	<!-- ======================================================================== -->
	<!--<xsl:template name="allergyRow"/>
	<xsl:template name="display1LineBreak"/>
	<xsl:template name="displayAllergyComponentSection"/>
	<xsl:template name="displayAuthorBlock"/>
	<xsl:template name="displayBottomLine"/>
	<xsl:template name="displayContactInfoBlock"/>
	<xsl:template name="displayContents"/>
	<xsl:template name="displayEncounterComponentSection"/>
	<xsl:template name="displayImmunizationsComponentSection"/>
	<xsl:template name="displayMedsComponentSection"/>
	<xsl:template name="displayPatientBlock"/>
	<xsl:template name="displayProblemComponentSection"/>
	<xsl:template name="displayProceduresComponentSection"/>
	<xsl:template name="displayReportDates"/>
	<xsl:template name="displayResultsComponentSection"/>
	<xsl:template name="displaySource"/>
	<xsl:template name="displayTableOfContents"/>
	<xsl:template name="displayTitle"/>
	<xsl:template name="displayVitalRow"/>
	<xsl:template name="displayVitalsBpItem"/>
	<xsl:template name="displayVitalsComponentSection"/>
	<xsl:template name="displayVitalsDateItem"/>
	<xsl:template name="displayVitalsHeightItem"/>
	<xsl:template name="displayVitalsMultiSeparator"/>
	<xsl:template name="displayVitalsPoxItem"/>
	<xsl:template name="displayVitalsPulseItem"/>
	<xsl:template name="displayVitalsRespItem"/>
	<xsl:template name="displayVitalsSourceItem"/>
	<xsl:template name="displayVitalsTempItem"/>
	<xsl:template name="displayVitalsWeightItem"/>
	<xsl:template name="encRow"/>
	<xsl:template name="flyoverSpan"/>
	<xsl:template name="immunizationsRow"/>
	<xsl:template name="labsRow"/>
	<xsl:template name="medRow"/>
	<xsl:template name="problemRow"/>
	<xsl:template name="procedureRow"/>-->
	<!-- End-of-Templates to be overridden -->
	<!-- ======================================================================== -->

	<xsl:template name="documentTitle">
		<xsl:param name="root"/>
		<xsl:choose>
			<xsl:when test="string-length($root/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name)>0">
				<xsl:value-of select="$root/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$root/n1:author[1]/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="getName">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:for-each select="$name/n1:given">
					<xsl:text> </xsl:text>
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:text> </xsl:text>
				<xsl:if test="string-length($name/n1:family)>0">
					<xsl:value-of select="$name/n1:family"/>
				</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:if test="string-length($name/n1:suffix)>0">
					<xsl:if test="$name/n1:suffix != ' '">
						<xsl:text>, </xsl:text>
						<xsl:value-of select="$name/n1:suffix"/>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="n1:entry">
		<xsl:variable name="allergy-prob-Root" select="n1:act/n1:entryRelationship/n1:observation/n1:templateId/@root"/>
		<xsl:variable name="med-imm-Root" select="n1:substanceAdministration/n1:templateId/@root"/>
		<xsl:variable name="labs-Root" select="../n1:templateId/@root"/>
		<xsl:variable name="vitals-Root" select="n1:organizer/n1:templateId/@root"/>
		<xsl:choose>
			<xsl:when test="$allergy-prob-Root='2.16.840.1.113883.10.20.1.18'">
				<xsl:call-template name="allergyRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$allergy-prob-Root!='2.16.840.1.113883.10.20.1.18'">
				<xsl:call-template name="problemRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="n1:encounter">
				<xsl:call-template name="encRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="n1:procedure">
				<xsl:call-template name="procedureRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$med-imm-Root='2.16.840.1.113883.3.88.11.83.13'">
				<xsl:call-template name="immunizationsRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$med-imm-Root!='2.16.840.1.113883.3.88.11.83.13'">
				<xsl:call-template name="medRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$labs-Root='2.16.840.1.113883.10.20.1.14'">
				<xsl:call-template name="labsRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$vitals-Root='2.16.840.1.113883.10.20.1.32'">
				<xsl:call-template name="cdcVitalsRow">
					<xsl:with-param name="row" select="."/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="cdcVitalsRow">
		<xsl:param name="row"/>
		<xsl:call-template name="displayVitalRow">
			<xsl:with-param name="row" select="$row"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="displayVitalsDate">
		<xsl:param name="rowData"/>
		<xsl:choose>
			<xsl:when test="string-length($rowData/n1:effectiveTime/@value)=0">
				<xsl:text>-- Not Available --</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateShort">
					<xsl:with-param name="dateString" select="$rowData/n1:effectiveTime/@value"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="displayVitalsTemp">
		<xsl:param name="temp"/>
        <xsl:choose>
            <xsl:when test="string-length($temp)>1">
                <xsl:for-each select="$temp">
                    <xsl:if test="position()>1">
                        <xsl:call-template name="displayVitalsMultiSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="string-length(n1:value/@value)>1">
                            <xsl:variable name="tempResult" select="n1:value/@value"/>
                            <xsl:choose>
                                <xsl:when test="n1:value/@unit">
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="concat($tempResult,n1:value/@unit)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="$tempResult"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
          	</xsl:when>	
            <xsl:otherwise>
                <xsl:call-template name="na"/>
            </xsl:otherwise>
      	</xsl:choose>	
	</xsl:template>

	<xsl:template name="displayVitalsPulse">
		<xsl:param name="pulse"/>
        <xsl:choose>
            <xsl:when test="string-length($pulse)>1">
                <xsl:for-each select="$pulse">
                    <xsl:if test="position()>1">
                        <xsl:call-template name="displayVitalsMultiSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="string-length(n1:value/@value)>1">
                            <xsl:variable name="pulseResult" select="n1:value/@value"/>
                            <xsl:choose>
                                <xsl:when test="n1:value/@unit">
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="concat($pulseResult,n1:value/@unit)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="$pulseResult"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
          	</xsl:when>	
            <xsl:otherwise>
                <xsl:call-template name="na"/>
            </xsl:otherwise>
      	</xsl:choose>	
	</xsl:template>

	<xsl:template name="displayVitalsResp">
		<xsl:param name="resp"/>
        <xsl:choose>
            <xsl:when test="string-length($resp)>1">
                <xsl:for-each select="$resp">
                    <xsl:if test="position()>1">
                        <xsl:call-template name="displayVitalsMultiSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="string-length(n1:value/@value)>1">
                            <xsl:variable name="respResult" select="n1:value/@value"/>
                            <xsl:choose>
                                <xsl:when test="n1:value/@unit">
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="concat($respResult,n1:value/@unit)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="$respResult"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
          	</xsl:when>	
            <xsl:otherwise>
                <xsl:call-template name="na"/>
            </xsl:otherwise>
      	</xsl:choose>	
	</xsl:template>

	<xsl:template name="displayVitalsBp">
		<xsl:param name="row"/>
		<xsl:variable name="systolic" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBpSystolic]"/>
		<xsl:variable name="diastolic" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBpDiastolic]"/>
		<xsl:variable name="bloodPressure" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBloodPressure]"/>
		<xsl:choose>
			<xsl:when test="$systolic/n1:value/@value or $diastolic/n1:value/@value or $bloodPressure/n1:value/@value">
				<xsl:call-template name="bpDetailLister">
					<xsl:with-param name="systolics" select="$systolic"/>
					<xsl:with-param name="diastolics" select="$diastolic"/>
				</xsl:call-template>
				<xsl:if test="$systolic/n1:value/@value and $bloodPressure/n1:value/@value">
					<xsl:call-template name="displayVitalsMultiSeparator"/>
				</xsl:if>
				<xsl:for-each select="$bloodPressure">
					<xsl:if test="position()>1">
						<xsl:call-template name="displayVitalsMultiSeparator"/>
					</xsl:if>
					<xsl:value-of select="n1:value/@value"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="displayVitalsHeight">
		<xsl:param name="height"/>
        <xsl:choose>
            <xsl:when test="string-length($height)>1">
                <xsl:for-each select="$height">
                    <xsl:if test="position()>1">
                        <xsl:call-template name="displayVitalsMultiSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="string-length(n1:value/@value)>1">
                            <xsl:variable name="heightResult" select="n1:value/@value"/>
                            <xsl:choose>
                                <xsl:when test="n1:value/@unit">
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="concat($heightResult,n1:value/@unit)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="$heightResult"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
          	</xsl:when>	
            <xsl:otherwise>
                <xsl:call-template name="na"/>
            </xsl:otherwise>
      	</xsl:choose>	
	</xsl:template>

	<xsl:template name="displayVitalsWeight">
		<xsl:param name="weight"/>
        <xsl:choose>
            <xsl:when test="string-length($weight)>1">
                <xsl:for-each select="$weight">
                    <xsl:if test="position()>1">
                        <xsl:call-template name="displayVitalsMultiSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="string-length(n1:value/@value)>1">
                            <xsl:variable name="weightResult" select="n1:value/@value"/>
                            <xsl:choose>
                                <xsl:when test="n1:value/@unit">
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="concat($weightResult,n1:value/@unit)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="$weightResult"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
          	</xsl:when>	
            <xsl:otherwise>
                <xsl:call-template name="na"/>
            </xsl:otherwise>
      	</xsl:choose>	
	</xsl:template>

	<xsl:template name="displayVitalsPox">
		<xsl:param name="pox"/>
        <xsl:choose>
            <xsl:when test="string-length($pox)>1">
                <xsl:for-each select="$pox">
                    <xsl:if test="position()>1">
                        <xsl:call-template name="displayVitalsMultiSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="string-length(n1:value/@value)>1">
                            <xsl:variable name="poxResult" select="n1:value/@value"/>
                            <xsl:choose>
                                <xsl:when test="n1:value/@unit">
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="concat($poxResult,n1:value/@unit)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="flyoverSpan">
                                        <xsl:with-param name="data" select="$poxResult"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="na"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
          	</xsl:when>	
            <xsl:otherwise>
                <xsl:call-template name="na"/>
            </xsl:otherwise>
      	</xsl:choose>	
	</xsl:template>

	<xsl:template name="displayVitalsSource">
		<xsl:param name="row"/>
		<xsl:choose>
			<xsl:when test="string-length($row/n1:organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name)>1">
				<xsl:call-template name="flyoverSpan">
					<xsl:with-param name="data" select="$row/n1:organizer/n1:author/n1:assignedAuthor/n1:representedOrganization/n1:name"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="na"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="displayVitalItems">
		<xsl:param name="row"/>
		<xsl:variable name="rowData" select="$row/n1:organizer/n1:component/n1:observation"/>
		<xsl:variable name="height" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincHeight]"/>
		<xsl:variable name="weight" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincWeight]"/>
		<xsl:variable name="systolic" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBpSystolic]"/>
		<xsl:variable name="diastolic" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBpDiastolic]"/>
		<xsl:variable name="temp" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincTemperature]"/>
		<xsl:variable name="pulse" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincPulse]"/>
		<xsl:variable name="resp" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincRespiration]"/>
		<xsl:variable name="pox" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincPulseOximetry]"/>
		<xsl:variable name="bloodPressure" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBloodPressure]"/>
		<xsl:variable name="bodyHtLying" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincBodyHtLying]"/>
		<xsl:variable name="headCircumOCF" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincOCF]"/>
		<xsl:variable name="weight2" select="$row/n1:organizer/n1:component/n1:observation[n1:code/@code=$loincWeight2]"/>		

		<xsl:call-template name="displayVitalsDateItem">
			<xsl:with-param name="rowData" select="$rowData"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsTempItem">
			<xsl:with-param name="temp" select="$temp"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsPulseItem">
			<xsl:with-param name="pulse" select="$pulse"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsRespItem">
			<xsl:with-param name="resp" select="$resp"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsBpItem">
			<xsl:with-param name="row" select="$row"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsHeightItem">
			<xsl:with-param name="height" select="$height"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsWeightItem">
			<xsl:with-param name="weight" select="$weight"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsPoxItem">
			<xsl:with-param name="pox" select="$pox"/>
		</xsl:call-template>

		<xsl:call-template name="displayVitalsSourceItem">
			<xsl:with-param name="row" select="$row"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="bpDetailLister">
		<xsl:param name="systolics"/>
		<xsl:param name="diastolics"/>
		<xsl:param name="index" select="1"/>
		<xsl:if test="(($systolics)[$index] or ($diastolics)[$index]) and $index>1">
			<xsl:call-template name="displayVitalsMultiSeparator"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="($systolics)[$index] and ($diastolics)[$index]">
				<xsl:value-of select="($systolics)[$index]/n1:value/@value"/>/<xsl:value-of select="($diastolics)[$index]/n1:value/@value"/>
				<xsl:call-template name="bpDetailLister">
					<xsl:with-param name="systolics" select="$systolics"/>
					<xsl:with-param name="diastolics" select="$diastolics"/>
					<xsl:with-param name="index" select="$index+1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="($systolics)[$index]">
				<xsl:value-of select="($systolics)[$index]/n1:value/@value"/>
				<xsl:call-template name="bpDetailLister">
					<xsl:with-param name="systolics" select="$systolics"/>
					<xsl:with-param name="diastolics" select="$diastolics"/>
					<xsl:with-param name="index" select="$index+1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="($diastolics)[$index]">
				<xsl:value-of select="($diastolics)[$index]/n1:value/@value"/>
				<xsl:call-template name="bpDetailLister">
					<xsl:with-param name="systolics" select="$systolics"/>
					<xsl:with-param name="diastolics" select="$diastolics"/>
					<xsl:with-param name="index" select="$index+1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="n1:component/n1:section">
		<xsl:apply-templates select="n1:title"/>
		<xsl:choose>
			<xsl:when test="n1:code[@code=$loincProblemCode] and not($noMdoProb)">
				<xsl:call-template name="displayProblemComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincAllergyCode]">
				<xsl:call-template name="displayAllergyComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincMedCode] and not($noMed)">
				<xsl:call-template name="displayMedsComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincEncounterCode]">
				<xsl:call-template name="displayEncounterComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincResultsCode] and not($noMdoResult)">
				<xsl:call-template name="displayResultsComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincProceduresCode]">
				<xsl:call-template name="displayProceduresComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincImmunizationsCode]">
				<xsl:call-template name="displayImmunizationsComponentSection"/>
			</xsl:when>
			
			<xsl:when test="n1:code[@code=$loincVitalsCode]">
				<xsl:call-template name="displayVitalsComponentSection"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
		<xsl:apply-templates select="n1:component/n1:section"/>
	</xsl:template>


</xsl:stylesheet>

