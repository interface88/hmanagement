<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />
	<table style="width: 93%" class="tdright">
		<tr>
			<td align="center" colspan="6">Patient Prescription</td>
		</tr>
		<tr>
			<td>OPD Number</td>
			<td>${opd.admissionId}</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>Date</td>
			<td>${opd.entryDate}</td>
		</tr>
		<tr>
			<td>Patient name</td>
			<td>${opd.patient.firstName} ${opd.patient.lastName}</td>
			<td>Sex</td>
			<td>${opd.patient.gender}</td>
			<td>Patient ID</td>
			<td>${opd.patient.id}</td>
		</tr>
		<tr>
			<td>Patient age</td>
			<td>${opd.patient.day} Day, ${opd.patient.month} Month, ${opd.patient.year} Year </td>
			<td>Weight</td>
			<td>${opd.patient.weight}</td>
			<td>Contact no.</td>
			<td>${opd.patient.mobile}</td>
		</tr>
		<tr>
			<td>Doctor name</td>
			<td colspan="6">${opd.doctor.name} </td>
		</tr>
		<tr>
			<td colspan="6"><div style="width: 100%; height: 400px; border: 1px solid;"><span style="padding: 20px;">Rx</span></div></td>
		</tr>
	</table>
<jsp:include page="../theme/parts/footerReport.jsp" />