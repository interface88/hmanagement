<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../theme/parts/headerReport.jsp" />
<div id="boundary">
<div id="content">
<div id="itsthetable">
<div class="project">Hospital Management System</div>
<div class="projectName">Admission Type</div>
<table summary="Submitted table designs">
		<caption>REPORT</caption>
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
					<td style="">${admissionType.code}</td>
					<td style="">${admissionType.name}</td>
				</tr>
			</c:forEach>
		</tbody>			
	</table>
</div>
</div>
</div>