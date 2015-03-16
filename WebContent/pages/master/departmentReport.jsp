<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Department Report</h3>
		<table>
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${departmentlist}" var="department">
					<tr>
						<td>${department.code}</td>
						<td>${department.name}</td>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 