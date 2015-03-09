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
								<form name="doctormaster" method="post"
									action="doctor_master">Services:&nbsp;&nbsp;
									<select id="ddlservices" name="ddlservices">
										<option value="-1">-Select-</option>
										<c:forEach items="${serviceList}" var="ser">
											<option value="${ser}">${ser}</option>
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
					<form name="doctormaster1" method="post"
						action="doctor_master">
						<table>
							<tr>
								<td align="left">Name</td>
								<td><input name="txtname" id="txtname"
									required="required" <c:if test="${edit=='yes'}"> disabled </c:if> value="${servicesdetails.name}"
									type="text" /></td>
							</tr>
							
							<tr>
								<td align="left">Department</td>
								<td><select id="ddldepartment" name="ddldepartment">

										<c:forEach items="${department}" var="dep">
											<option value="${dep}">${dep}</option>
										</c:forEach>
								</select></td>
							</tr>
						
							<tr>
								<td align="left">Services Charge</td>
								<td><input name="txtfee" required="required"
									id="txtfee" value="${servicesdetails.charges}"
									type="text" /></td>
							</tr>
							<tr>
								<td colspan="100%"></td>
							</tr>
							<tr >
								<td colspan="100%" align="center"><input name="action" type="submit" value="Add" />&nbsp;&nbsp;&nbsp;<input name="action" type="submit" value="Save" />&nbsp;&nbsp;&nbsp;
									<input name="action" type="submit" value="Delete" /> <input
									type="hidden" name="txtedit" value="${edit}" />&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset"/></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
<jsp:include page="../../theme/parts/footer.jsp" />
							