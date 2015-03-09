<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../theme/parts/header.jsp" />
		<table align="center" style="width: 70%; padding: 0;"
			class="simplebox">
			<tr>
				<td align="center" colspan="100%"><strong>Service
						Master</strong></td>
			</tr>
			<tr>
				<td colspan="100%" align="center"><font color="#00aa00">
						<c:out value="${msg}" />
				</font></td>

			</tr>
			<tr>
				<td align="center">
					<table class="simpleboxtop">

						<tr>
							<td align="center">
								<form name="servicesMasterShow" method="post"
									action="services">Services:&nbsp;&nbsp;
									<select id="serviceId" name="serviceId">
										<option value="-1">-Select-</option>
										<c:forEach items="${serviceList}" var="service">
											<option value="${service.id}">${service.name}</option>
										</c:forEach>
									</select> &nbsp;&nbsp;&nbsp; <input type="submit" name="action"
										value="Show" />
								</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<form name="servicesMaster" method="post"
						action="services">
						<input type="hidden" name="id" value="${service.id}">
						<table>
							<tr>
								<td align="left">Name</td>
								<td><input name="name" id="name"
									required="required" <c:if test="${editMode=='true'}"> readonly="readonly" </c:if> value="${service.name}"
									type="text" />
								</td>
							</tr>

							<tr>
								<td align="left">Code</td>
								<td><input name="code" id="code"
									required="required" <c:if test="${editMode=='true'}"> readonly="readonly" </c:if> value="${service.code}"
									type="text" />
								</td>
							</tr>
							
							<tr>
								<td align="left">Department</td>
								<td><select id="department" name="department">

										<c:forEach items="${departmentList}" var="dep">
											<option value="${dep.id}" ${dep.id == service.department.id ? 'selected' : ''}>${dep.name}</option>
										</c:forEach>
								</select></td>
							</tr>
						
							<tr>
								<td align="left">Services Charge</td> 
								<td><input name="fee" required="required"
									id="fee" value="${service.charges}"
									type="text" /></td>
							</tr>
							<tr>
								<td colspan="100%"></td>
							</tr>
							<tr >
								<td colspan="100%" align="center">
								<c:choose>
									<c:when test="${editMode=='true'}">
										<input name="action" type="submit" value="Update" />&nbsp;&nbsp;&nbsp;
										<input name="action" type="submit" value="Delete" /> 
									</c:when>
									<c:otherwise>
										<input name="action" type="submit" value="Add" />&nbsp;&nbsp;&nbsp;
									</c:otherwise>
								</c:choose>
								<input type="reset" value="Reset"/>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
<jsp:include page="../../theme/parts/footer.jsp" />
							