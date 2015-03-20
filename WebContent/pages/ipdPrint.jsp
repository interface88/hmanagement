<%@page import="com.app.framework.Auth"%>
<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />
		<h3 class="clearfix">IPD Report</h3>
		<table>
			<tr>
				<td><b>Staff Name</b> &nbsp;&nbsp;&nbsp;<code>${ipd.staffName}</code></code></td>
				<td style="width: 180px">&nbsp;</td>
				<td>&nbsp;<b>Date Tim</b>e&nbsp;&nbsp;&nbsp; <code>${ipd.entryDate}</code></td>
			</tr>
			<tr>
				<td><b>Patient Reg No</b></td>
				<td><b>Patient Reg Date</b></td>
				<td><b>Contact Info</b></td>
			</tr>
			<tr>
				<td><code>${ipd.patient.registrationNo}</code></td>
				<td><code>${ipd.patient.registrationDate}</code></td>
				<td><code>${ipd.patient.contactInfo}</code></td>
			</tr>
			<tr>
				<td><b>Patient Name</b> </td>
				<td><b>Age</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><code>${ipd.patient.firstName}</code> <code>${ipd.patient.middleName}</code> <code>${ipd.patient.lastName}</code></td>
				<td><code>${opd.patient.year}</code> year / <code>${opd.patient.month}</code> month / <code>${opd.patient.day}</code> day</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><b>OPD Date</b></td>
				<td><b>OPD Doctor</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><code>${opd.entryDate}</code></td>
				<td><code>${opd.doctor.name}</code></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td ><b>Admission ID</b></td>
				<td><b>Admission Date</b></td>
				<td style="width: 180px"><b>Admission Time</b></td>
			</tr>
			<tr>
				<td ><code>${ipd.admissionId}</code></td>
				<td><code>${ipd.admissionDate}</code></td>
				<td style="width: 180px"><code>${ipd.admissionTime}</code></td>
			</tr>
			<tr>
				<td ><b>Admission Type</b></td>
				<td><b>Admitting Doctor</b></td>
				<td style="width: 180px">&nbsp;</td>
			</tr>
			<tr>
				<td ><code>${ipd.admissionType.name}</code>
				</td>
				<td><code>${ipd.doctor.name}</code>
				</td>
				<td style="width: 180px">&nbsp;</td>
			</tr>
			<tr>
				<td ><b>Ward</b></td>
				<td><b>Bed No.</b></td>
				<td style="width: 180px">&nbsp;</td>
			</tr>
			<tr>
				<td ><code>${ipd.ward}</code>
				</td>
				<td>
					<code>${ipd.bedNo}</code>
				</td>
				<td style="width: 180px">&nbsp;</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td><b>Admission Diagnosis</b></td>
				<td><b>Admission Details</b></td>
				<td><b>Suggested Treatment</b></td>
			</tr>
			<tr>
				<td>
				<code>${ipd.admissionDiagnosis}</code></td>
				<td>
				<code>${ipd.admissionDetail}</code></td>
				<td>
				<code>${ipd.admissionTreatment}</code></td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td><b>Allergy Details</b></td>
				<td colspan="2"><b>Special Notes</b></td>
			</tr>
			<tr>
				<td>
					<code>${ipd.allergyDetail}</code>
				</td>
				<td colspan="3">
					<code>${ipd.specialNote}</code>
				</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td ><b>Advance Payment</b></td>
				<td><code>${ipd.advancePayment}</code></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td ><b>Remarks</b></td>
				<td colspan="3">
					<code>${ipd.remark}</code>
				</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="100%">
				<code>
DECLARATION 								
I _________________(Patient of Relation) being the ____________(relationship with patient) 								
declare that : The details provided in this admission form are true and complete.								
								
Date: 	<br />	<br />						
Signature of Patient/Relatives ___________________<span style="float: right">Operator Sign</span> 	
<br /><br /><br />
					</code>
				</td>
			</tr>
		</table>
<jsp:include page="../theme/parts/footerReport.jsp" />