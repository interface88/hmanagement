<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<table class="pure-table">
		<thead>
			<tr>
				<th>Admission No</th>
				<th>Entry Date</th>
				<th>Patient</th>
				<th>Doctor</th>
				<th>Consulation Fee</th>
				<th></th>
				<th></th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach items="${opdlist}" var="opd">
				<tr>
					<td>${opd.admissionId}</td>
					<td>${opd.patient.firstName} ${opd.patient.middleName} ${opd.patient.lastName}</td>
					<td>${opd.entryDate}</td>
					<td>${opd.doctor.name}</td>
					<td>${opd.consulationFee}</td>
					<th><a href="">Edit</a></th>
					<th><a href="">Delete</a></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<jsp:include page="../theme/parts/footer.jsp" />