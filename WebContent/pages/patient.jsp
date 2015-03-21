<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<table style="width: 100%; margin:10px 0;">
		<tr>
			<td><h4 style="color:red;">${msg}</h4></td>
		</tr>
	</table>
	<form action="patient" name="action" style="margin-bottom: 30px;" method="post">
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
				<th>Registration No</th>
				<th>Registration Date</th>
				<th>Name</th>
				<th>Gender</th>
				<th></th>
				<th></th>
			</tr>	
		</thead>
		<tbody>
			<% int i = 1; %>
			<c:if test="${not empty patientlist}">
				<c:forEach items="${patientlist}" var="patient">
					<tr>
						<td><%=i%></td>
						<td>${patient.registrationNo}</td>
						<td>${patient.registrationDate}</td>
						<td>${patient.firstName} ${patient.middleName} ${patient.lastName}</td>
						<td>${patient.gender}</td>
						<th><a href="patient?action=edit&id=${patient.id}">Edit</a></th>
						<th><a href="patient?action=delete&id=${patient.id}">Delete</a></th>
					</tr>
					<% i++; %>
				</c:forEach>
			</c:if>
			<c:if test="${empty patientlist}">
				<tr>
					<td colspan="6" align="center"> No record present</td>
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