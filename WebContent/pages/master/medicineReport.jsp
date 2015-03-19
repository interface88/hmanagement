<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Medicine Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>Rate</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${medicinelist}" var="medicine">
					<tr>
						<td><code>${medicine.code}</code></td>
						<td><code>${medicine.name}</code></td>
						<td><code>${medicine.rate}</code></td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 