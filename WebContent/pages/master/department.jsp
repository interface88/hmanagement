<jsp:include page="../../theme/parts/header.jsp" />
	<form name="department_master" method="post" action="department_master">
		<table align="center" style="width:55%;  padding:3%;" class="simplebox">
			<tr>
				<td align="center" colspan="100%" ><strong>Department Master</strong></td>
			</tr>
			<tr>
				<td colspan="100%" align="center"><font color="#00aa00"> <c:out value="${msg}"/></font></td>
				
			</tr>
			<tr>
					
				<td style="" align="left">Departments</td>
				<td style="">
					<select style="width:150px;" id="ddldepartment" name="ddldepartment">
						<option	value="-1">-Select-</option>
						<c:forEach items="${departmentlist}" var="dep">
							<option value="${dep.id}">${dep.name}</option>
						</c:forEach>
					</select>
				</td>
				<td><input name="action" type="submit" value="Delete" />	</td>											
			</tr>
			<tr>
				
				<td style="" align="left">New Department</td>
				<td style=""><input name="txtdepname" id="txtdepname" required="required"  type="text" /></td>
				<td><input name="action" type="submit" value="Save" /></td>
					
			</tr>
		</table>
	</form>
<jsp:include page="../../theme/parts/footer.jsp" />