<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../theme/parts/headerReport.jsp" />
      <h3 class="clearfix"> Admission Type Report</h3>
			<table summary="Submitted table designs">
				<thead>
					<tr>
						<th scope="col">Code</th>
						<th scope="col">Name</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
				</tfoot>
				<tbody>			
							
					<c:forEach items="${admissionTypelist}" var="admissionType">
						<tr>
							<td><code>${admissionType.code}</code></td>
							<td><code>${admissionType.name}</code></td>
						</tr>
					</c:forEach>
				</tbody>			
			</table>
<jsp:include page="../../theme/parts/footerReport.jsp" /> 