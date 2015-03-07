<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-Doc Master</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>

<body>

	<div>
		<table class="maintble">
			<!-- Header Part -->
			<tr>
				<td align="center"><jsp:include page="../..//parts/header.jsp" /></td>
			</tr>
			<tr>
				<td align="center"><jsp:include page="../..//parts/menu.jsp" /></td>
			</tr>
			<!-- Middle Part -->
			<tr>
				<td
					style="background-image: url('..//images/bg.jpg'); background-repeat: repeat;">
					<table class="intble ">
						<tr>
							<td valign="top" class="leftPanel"><jsp:include
									page="../..//parts/leftPanel.jsp" /></td>
							<!-- Middle Left Pard -->

							<td align="center" class="boxMiddle">


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
														<form name="doctormaster" method="post"
															action="doctor_master">Doctors:&nbsp;&nbsp;
															<select id="ddldoctor" name="ddldoctor">
																<option value="-1">-Select-</option>
																<c:forEach items="${doctornames}" var="doc">
																	<option value="${doc}">${doc}</option>
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
															required="required" <c:if test="${edit=='yes'}"> disabled </c:if> value="${doctordetails.name}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Address1</td>
														<td><input name="txtaddress1" id="txtaddress1"
															required="required" value="${doctordetails.address1}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Address2</td>
														<td><input name="txtaddress2" id="txtaddress2"
															 value="${doctordetails.address2}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Qualification</td>
														<td><input name="txtqualification"
															required="required"
															value="${doctordetails.qualification}"
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
															required="required" value="${doctordetails.dutyHours}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Weekly off day</td>
														<td><input name="txtweekoff" required="required"
															id="txtweekoff" value="${doctordetails.weeklyoff}"
															type="text" /></td>
													</tr>
													<tr>
														<td align="left">Consultation Fee</td>
														<td><input name="txtfee" required="required"
															id="txtfee" value="${doctordetails.consultationfee}"
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
				<td><jsp:include page="../..//parts/footer.jsp" /></td>
			</tr>
		</table>
	</div>
</body>
</html>