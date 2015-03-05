<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-Staff Master</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="theme/css/main.css" />

</head>

<body>

	<div>
		<table class="maintble">
			<!-- Header Part -->
			<tr>
				<td align="center"><jsp:include page="../../theme/parts/footer.jsp" /></td>
			</tr>
			<tr>
				<td align="center"><jsp:include page="../../theme/parts/footer.jsp" /></td>
			</tr>
			<!-- Middle Part -->
			<tr>
				<td
					style="background-image: url('../theme/images/bg.jpg'); background-repeat: repeat;">
					<table class="intble ">
						<tr>
							<td valign="top" class="leftPanel"><jsp:include
									page="../../theme/parts/footer.jsp" /></td>
							<!-- Middle Left Pard -->

							<td align="center" class="boxMiddle">


								<table align="center" style="width: 70%; padding: 0;"
									class="simplebox">
									<tr>
										<td align="center" colspan="100%"><strong>Staff
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
															action="doctor_master">Staff:&nbsp;&nbsp;
															<select id="ddlstaff" name="ddlstaff">
																<option value="-1">-Select-</option>
																<c:forEach items="${staffnames}" var="stf">
																	<option value="${stf}">${stf}</option>
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
															required="required" <c:if test="${edit=='yes'}"> disabled </c:if> value="${staffdetails.name}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Address1</td>
														<td><input name="txtaddress1" id="txtaddress1"
															required="required" value="${staffdetails.address1}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Address2</td>
														<td><input name="txtaddress2" id="txtaddress2"
															 value="${staffdetails.address2}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Qualification</td>
														<td><input name="txtqualification"
															required="required"
															value="${staffdetails.qualification}"
															id="txtqualification" type="text" /></td>
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
														<td align="left">Duty Hours</td>
														<td><input name="txtdutyhours" id="txtdutyhours"
															required="required" value="${staffdetails.dutyHours}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Login Type</td>
														<td><input name="txtlogintype" required="required"
															id="txtlogintype" value="${staffdetails.loginType}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">User ID</td>
														<td><input name="txtuserid" required="required"
															id="txtuserid" value="${staffdetails.consultationfee}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Password</td>
														<td><input name="txtpassword" required="required"
															id="txtpassword" value="${staffdetails.consultationfee}"
															type="text" /></td>
													</tr>
													<tr>
														<td colspan="100%"></td>
													</tr>
													<tr>
														<td colspan="100%" align="center"><input name="action" type="submit" value="Add" />&nbsp;&nbsp;&nbsp;<input name="action" type="submit" value="Save" />&nbsp;&nbsp;&nbsp;
															<input name="action" type="submit" value="Delete" /> <input
															type="hidden" name="txtedit" value="${edit}" />&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset"/></td>
													</tr>
												</table>
											</form>
										</td>
									</tr>
								</table>

							</td>

						</tr>
					</table>

				</td>
			</tr>
			<!-- Footer Part -->
			<tr>
				<td><jsp:include page="../../theme/parts/footer.jsp" /></td>
			</tr>
		</table>
	</div>
</body>
</html>