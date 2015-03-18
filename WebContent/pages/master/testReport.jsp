<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Test Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>Rate</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${testlist}" var="test">
					<tr>
						<td>${test.code}</td>
						<td>${test.name}</td>
						<td>${test.rate}</td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 