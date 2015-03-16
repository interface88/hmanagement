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
						<td>${doctor.code}</td>
						<td>${doctor.name}</td>
						<td>${doctor.dutyHours}</td>
						<td>${doctor.qualification}</td>
						<td>${doctor.consultationfee}</td>
						<td>${doctor.weeklyoff}</td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 