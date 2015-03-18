<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<table style="width: 100%; margin:10px 0;">
		<tr>
			<td><h4 style="color:red;">${msg}</h4></td>
		</tr>
	</table>
	<table class="pure-table">
		<thead>
			<tr>
				<th>Registration No</th>
				<th>Registration Date</th>
				<th>Name</th>
				<th>Gender</th>
				<th></th>
				<th></th>
			</tr>	
		</thead>
		<tbody>
			<c:if test="${not empty patientlist}">
				<c:forEach items="${patientlist}" var="patient">
					<tr>
						<td>${patient.registrationNo}</td>
						<td>${patient.registrationDate}</td>
						<td>${patient.firstName} ${patient.middleName} ${patient.lastName}</td>
						<td>${patient.gender}</td>
						<th><a href="patient?action=edit&id=${patient.id}">Edit</a></th>
						<th><a href="patient?action=delete&id=${patient.id}">Delete</a></th>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty patientlist}">
				<tr>
					<td colspan="6" align="center"> No record present</td>
				</tr>
			</c:if>
		</tbody>
	</table>
<jsp:include page="../theme/parts/footer.jsp" />