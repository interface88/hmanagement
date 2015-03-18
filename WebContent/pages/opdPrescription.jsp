<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />
	<h3 class="clearfix">Patient Prescription</h3>
	<table style="width: 93%" class="tdright">
		<tr>
			<td><b>OPD Number</b></td>
			<td><code>${opd.admissionId}</code></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><b>Date</b></td>
			<td><code>${opd.entryDate}</code></td>
		</tr>
		<tr>
			<td><b>Patient name</b></td>
			<td><code>${opd.patient.firstName}</code> <code>${opd.patient.lastName}</code></td>
			<td><b>Sex</b></td>
			<td><code>${opd.patient.gender}</code></td>
			<td><b>Patient Reg no</b></td>
			<td><code>${opd.patient.registrationNo}</code></td>
		</tr>
		<tr>
			<td><b>Patient age</b></td>
			<td><code>${opd.patient.day}</code> Day, <code>${opd.patient.month}</code> Month, <code>${opd.patient.year}</code> Year </td>
			<td><b>Weight</b></td>
			<td><code>${opd.patient.weight}</code></td>
			<td><b>Contact no.</b></td>
			<td><code>${opd.patient.mobile}</code></td>
		</tr>
		<tr>
			<td><b>Doctor name</b></td>
			<td colspan="6"><code>${opd.doctor.name}</code> </td>
		</tr>
		<tr>
			<td colspan="6"><div style="width: 100%; height: 400px; border: 1px solid;"><span style="padding: 20px;">Rx</span></div></td>
		</tr>
	</table>
<jsp:include page="../theme/parts/footerReport.jsp" />