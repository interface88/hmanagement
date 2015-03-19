<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Doctor Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>Duty Hour</th>
					<th>qualification</th>
					<th>Consultation fee</th>
					<th>Weekly Off</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${doctorlist}" var="doctor">
					<tr>
						<td><code>${doctor.code}</code></td>
						<td><code>${doctor.name}</code></td>
						<td><code>${doctor.dutyHours}</code></td>
						<td><code>${doctor.qualification}</code></td>
						<td><code>${doctor.consultationfee}</code></td>
						<td><code>${doctor.weeklyoff}</code></td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 