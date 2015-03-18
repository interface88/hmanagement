<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<table style="width: 100%; margin:10px 0;">
		<tr>
			<td><h4 style="color:red;">${msg}</h4></td>
			<td style="text-align: right;"><a href="opd?action=addNew">Add New OPD</a></td>
		</tr>
	</table>
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
			<c:if test="${not empty opdlist}">
				<c:forEach items="${opdlist}" var="opd">
					<tr>
						<td>${opd.admissionId}</td>
						<td>${opd.patient.firstName} ${opd.patient.middleName} ${opd.patient.lastName}</td>
						<td>${opd.entryDate}</td>
						<td>${opd.doctor.name}</td>
						<td>${opd.consulationFee}</td>
						<th><a href="opd?action=edit&id=${opd.id}">Edit</a></th>
						<th><a href="">Delete</a></th>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty opdlist}">
				<tr>
					<td colspan="7" align="center"> No record present</td>
				</tr>
			</c:if>
		</tbody>
	</table>
<jsp:include page="../theme/parts/footer.jsp" />