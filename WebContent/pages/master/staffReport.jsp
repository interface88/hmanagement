<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Staff Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>User Id</th>
					<th>Department</th>
					<th>dutyHours</th>
					<th>qualification</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${stafflist}" var="staff">
					<tr>
						<td>${staff.code}</td>
						<td>${staff.name}</td>
						<td>${staff.userId}</td>
						<td>${staff.department.name}</td>
						<td>${staff.dutyHours}</td>
						<td>${staff.qualification}</td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 