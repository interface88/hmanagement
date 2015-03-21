<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<table style="width: 100%; margin:10px 0;">
		<tr>
			<td><h4 style="color:red;">${msg}</h4></td>
			<td style="text-align: right;"><a href="opd?action=addNew">Add New OPD</a></td>
		</tr>
	</table>
	<form action="opd" name="action" style="margin-bottom: 30px;" method="post">
		<table>
			<tr>
				<td>Start Date &nbsp;&nbsp;<input type="text" name="startDate" id="startDate" value="${startDate}" style="width:100px;"></td>
				<td>End Date&nbsp;&nbsp;<input type="text" name="endDate" id="endDate" value="${endDate}" style="width:100px;"></td>
				<td><input type="submit" name="action" value="Search"> </td>
			</tr>		
		</table>
	</form>
	<table class="pure-table">
		<thead>
			<tr>
				<th>S.No</th>
				<th>Admission No</th>
				<th>Patient</th>
				<th>Entry Date</th>
				<th>Doctor</th>
				<th>Consultation Fee</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>	
		</thead>
		<tbody>
			<% int i = 1; %>
			<c:if test="${not empty opdlist}">
				<c:forEach items="${opdlist}" var="opd">
					<tr>
						<td><%=i%></td>
						<td>${opd.admissionId}</td>
						<td>${opd.patient.firstName} ${opd.patient.middleName} ${opd.patient.lastName}</td>
						<td>${opd.entryDate}</td>
						<td>${opd.doctor.name}</td>
						<td>${opd.consulationFee}</td>
						<th><a href="opd?action=edit&id=${opd.id}">Edit</a></th>
						<th><a href="">Delete</a></th>
						<th><a href="opd?action=prescription&id=${opd.id}">Print prescription</a></th>
					</tr>
					<% i++; %>
				</c:forEach>
			</c:if>
			<c:if test="${empty opdlist}">
				<tr>
					<td colspan="7" align="center"> No record present</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<script>
		Calendar.setup({
            trigger    : "startDate",
            inputField : "startDate",
            dateFormat: "%d-%m-%Y"
        });
		Calendar.setup({
            trigger    : "endDate",
            inputField : "endDate",
            dateFormat: "%d-%m-%Y"
        });
	</script>
<jsp:include page="../theme/parts/footer.jsp" />