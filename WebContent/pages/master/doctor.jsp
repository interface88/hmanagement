<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../theme/parts/header.jsp" />
		<table align="center" style="width: 70%; padding: 0;"
			class="simplebox">
			<tr>
				<td align="center" colspan="100%"><strong>Doctor
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
								<form name="doctorsMasterShow" method="post"
									action="doctor">Doctors:&nbsp;&nbsp;
									<select id="doctorId" name="doctorId">
										<option value="-1">-Select-</option>
										<c:forEach items="${doctorList}" var="doctor">
											<option value="${doctor.id}">${doctor.name}</option>
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
					<form name="doctorsMaster" method="post"
						action="doctor">
						<input type="hidden" name="id" value="${doctor.id}">
						<table>
							<tr>
								<td align="left">Name</td>
								<td><input name="name" id="name"
									required="required" <c:if test="${editMode=='true'}"> readonly="readonly" </c:if> value="${doctor.name}"
									type="text" />
								</td>
							</tr>

							<tr>
								<td align="left">Code</td>
								<td><input name="code" id="code"
									required="required" <c:if test="${editMode=='true'}"> readonly="readonly" </c:if> value="${doctor.code}"
									type="text" />
								</td>
							</tr>
							
							<tr>
								<td align="left">Department</td>
								<td><select id="department" name="department">

										<c:forEach items="${departmentList}" var="dep">
											<option value="${dep.id}" ${dep.id == doctor.department.id ? 'selected' : ''}>${dep.name}</option>
										</c:forEach>
								</select></td>
							</tr>
						
							<tr>
								<td align="left">Address 1</td> 
								<td><input name="address1" 
									id="fee" value="${doctor.address1}"
									type="text" /></td>
							</tr>
							<tr>
								<td align="left">Address 1</td> 
								<td><input name="address2" 
									id="fee" value="${doctor.address2}"
									type="text" /></td>
							</tr>
							<tr>
								<td align="left">Duty Hours</td> 
								<td><input name="dutyHours" 
									id="fee" value="${doctor.dutyHours}"
									type="text" /></td>
							</tr>
							<tr>
								<td align="left">Qualification</td> 
								<td><input name="qualification" 
									id="fee" value="${doctor.qualification}"
									type="text" /></td>
							</tr>
							<tr>
								<td align="left">Consultation fee</td> 
								<td><input name="consultationfee" 
									id="fee" value="${doctor.consultationfee}"
									type="text" /></td>
							</tr>
							<tr>
								<td align="left">Weekly off day</td> 
								<td><input name="weeklyoff"
									id="fee" value="${doctor.weeklyoff}"
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
							