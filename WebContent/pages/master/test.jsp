<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../theme/parts/header.jsp" />
	<form name="test" method="post" action="test">
		<table align="center" style="width:55%;  padding:3%;" class="simplebox">
			<tr>
				<td colspan="100%" align="center"><font color="#00aa00"><c:out value="${msg}"/></font></td>
				
			</tr>
			<tr>
				<td align="center" colspan="100%" ><strong>Existing Tests</strong></td>
			</tr>
			<tr>
					
				<td style="" align="left">Tests</td>
				<td style="">
					<select style="width:150px;" id="ddltest" name="ddltest">
						<option	value="-1">-Select-</option>
						<c:forEach items="${testlist}" var="test">
							<option value="${test.id}">${test.name}</option>
						</c:forEach>
					</select>
				</td>
				<td><input name="action" type="submit" value="Delete" />	</td>											
			</tr>
			
			</table>
	</form>
	<br/>
	<form name="test" method="post" action="test">
		<table align="center" style="width:55%;  padding:3%;" class="simplebox">
			<tr>
				<td align="center" colspan="100%" ><strong>Add new Test</strong></td>
			</tr>
			<tr>
				<td style=";" align="left">Code</td>
				<td style=""><input name="code" id="code" required="required"  type="text" /></td>
				<td>&nbsp;</td>
					
			</tr>
			<tr>
				
				<td style=";" align="left">Name</td>
				<td style=""><input name="name" id="name" required="required"  type="text" /></td>
				<td>&nbsp;</td>
					
			</tr>
			<tr>
				
				<td style=";" align="left">Rate</td>
				<td style=""><input name="rate" id="rate" required="required"  type="number" step="any" /></td>
				<td><input name="action" type="submit" value="Add" /></td>
					
			</tr>
			
		</table>
	</form>
<jsp:include page="../../theme/parts/footer.jsp" />