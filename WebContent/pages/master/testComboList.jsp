<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<option	value="">-Select-</option>
<c:forEach items="${testlist}" var="test">
	<option value="${test.rate}">${test.name}</option>
</c:forEach>
