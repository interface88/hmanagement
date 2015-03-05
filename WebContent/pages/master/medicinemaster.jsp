<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-Medicine Master</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>

<body>

	<div >
		<table class="maintble">
			<!-- Header Part -->
			<tr>
				<td align="center"><jsp:include page="common/Header.jsp" /></td>
			</tr>
			<tr>
				<td align="center"><jsp:include page="common/MenuHeader.jsp" /></td>
			</tr>
			<!-- Middle Part -->
			<tr>
				<td
					style="background-image: url('images/bg.jpg'); background-repeat: repeat;">
					<table class="intble ">
						<tr>
							<td valign="top" class="leftPanel"><jsp:include
									page="leftpanel/homeleft.jsp" /></td>
							<!-- Middle Left Pard -->

							<td align="center" class="boxMiddle" >
							
									<form name="department_master" method="post" action="department_master">
									<table align="center" style="width:55%;  padding:3%;" class="simplebox">
										<tr>
											<td align="center" colspan="100%" ><strong>Medicine Master</strong></td>
										</tr>
										<tr>
											<td colspan="100%" align="center"><font color="#00aa00"><c:out value="${msg}"/></font></td>
											
										</tr>
										<tr>
												
											<td style="" align="left">Medicines</td>
											<td style="">
												<select style="width:150px;" id="ddlmedicine" name="ddlmedicine">
													<option	value="-1">-Select-</option>
													<c:forEach items="${medicine}" var="med">
														<option value="${med}">${med}</option>
													</c:forEach>
												</select>
											</td>
											<td><input name="action" type="submit" value="Delete" />	</td>											
										</tr>
										
									
										<tr>
											
											<td style=";" align="left">Name</td>
											<td style=""><input name="txtmedicinename" id="txtmedicinename" required="required"  type="text" /></td>
											<td><input name="action" type="submit" value="Save" /></td>
												
										</tr>
										
									</table>
								</form>
							</td>

						</tr>
					</table>

				</td>
			</tr>
			<!-- Footer Part -->
			<tr>
				<td	><jsp:include
						page="common/Footer.jsp" /></td>
			</tr>
		</table>
	</div>
</body>
</html>