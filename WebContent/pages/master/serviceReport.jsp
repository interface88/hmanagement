<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Service Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>Department</th>
					<th>Charges</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${servicelist}" var="service">
					<tr>
						<td><code>${service.code}</code></td>
						<td><code>${service.name}</code></td>
						<td><code>${service.department.name}</code></td>
						<td><code>${service.charges}</code></td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 