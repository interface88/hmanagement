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
						<td><code>${staff.code}</code></td>
						<td><code>${staff.name}</code></td>
						<td><code>${staff.userId}</code></td>
						<td><code>${staff.department.name}</code></td>
						<td><code>${staff.dutyHours}</code></td>
						<td><code>${staff.qualification}</code></td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 