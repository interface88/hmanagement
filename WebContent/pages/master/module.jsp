<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../theme/parts/header.jsp" />
	<form name="module" method="post" action="module">
		<table align="center" style="width:55%;  padding:3%;" class="simplebox">
			<tr>
				<td colspan="100%" align="center"><font color="#00aa00"><c:out value="${msg}"/></font></td>
				
			</tr>
			<tr>
				<td align="center" colspan="100%" ><strong>Existing Modules</strong></td>
			</tr>
			<tr>
					
				<td style="" align="left">Modules</td>
				<td style="">
					<select style="width:150px;" id="ddlmodule" name="ddlmodule">
						<option	value="-1">-Select-</option>
						<c:forEach items="${modulelist}" var="module">
							<option value="${module.id}">${module.name}</option>
						</c:forEach>
					</select>
				</td>
				<td><input name="action" type="submit" value="Delete" />	</td>											
			</tr>
			
			</table>
	</form>
	<br/>
	<form name="module" method="post" action="module">
		<table align="center" style="width:55%;  padding:3%;" class="simplebox">
			<tr>
				<td align="center" colspan="100%" ><strong>Add new module</strong></td>
			</tr>
		
			<tr>
				
				<td style=";" align="left">Code</td>
				<td style=""><input name="code" id="code" required="required"  type="text" /></td>
				<td>&nbsp;</td>
					
			</tr>
			<tr>
				
				<td style=";" align="left">Name</td>
				<td style=""><input name="name" id="name" required="required"  type="text" /></td>
				<td><input name="action" type="submit" value="Add" /></td>
					
			</tr>
			
		</table>
	</form>
<jsp:include page="../../theme/parts/footer.jsp" />