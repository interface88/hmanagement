<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Ward Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${wardlist}" var="ward">
					<tr>
						<td><code>${ward.code}</code></td>
						<td><code>${ward.name}</code></td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 