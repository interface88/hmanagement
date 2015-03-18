<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<table style="width: 100%; margin:10px 0;">
		<tr>
			<td><h4 style="color:red;">${msg}</h4></td>
			<td style="text-align: right;"><a href="ipd?action=addNew">Add New IPD</a></td>
		</tr>
	</table>
	<table class="pure-table">
		<thead>
			<tr>
				<th>Admission No</th>
				<th>Patient</th>
				<th>Admission Date</th>
				<th>Admission Time</th>
				<th>Doctor</th>
				<th>Admission Type</th>
				<th></th>
				<th></th>
			</tr>	
		</thead>
		<tbody>
			<c:if test="${not empty ipdlist}">
				<c:forEach items="${ipdlist}" var="ipd">
					<tr>
						<td>${ipd.admissionId}</td>
						<td>${ipd.patient.firstName} ${ipd.patient.middleName} ${ipd.patient.lastName}</td>
						<td>${ipd.admissionDate}</td>
						<td>${ipd.admissionTime}</td>
						<td>${ipd.doctor.name}</td>
						<td>${ipd.admissionType.name}</td>
						<th><a href="ipd?action=edit&id=${ipd.id}">Edit</a></th>
						<th><a href="">Delete</a></th>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty ipdlist}">
				<tr>
					<td colspan="7" align="center"> No record present</td>
				</tr>
			</c:if>
		</tbody>
	</table>
<jsp:include page="../theme/parts/footer.jsp" />