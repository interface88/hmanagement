<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		<form name="patient" method="post" action="patient">
			<input type="hidden" name="id" value="${patient.id}">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="4">
						<strong>Patient Edit Form</strong>
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td colspan="4"><h4 style="color:red;">${msg}</h4></td>
				</tr>
				<tr>
					<td>Patient Reg No</td>
					<td>
						<input id="registrationNo" readonly="readonly" type="text" value="${patient.registrationNo}" />
					</td>
					<td>Registration Date</td>
					<td><input readonly="readonly" id="registrationDate" type="text" value="${patient.registrationDate}" /></td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr align="left">
					<td colspan="4">
						<table style="width: 77%">
							<tr>
								<td>Title</td>
								<td>First Name</td>
								<td>Surname</td>
								<td>Middle Name</td>
							</tr>
							<tr>
								<td><select name="title" required="required">
										<option value="">-Select-</option>
										<option <c:if test="${patient.title=='Mr.'}">selected=selected</c:if> value="Mr.">Mr.</option>
										<option <c:if test="${patient.title=='Ms.'}">selected=selected</c:if> value="Ms.">Mrs.</option>
										<option <c:if test="${patient.title=='Mrs.'}">selected=selected</c:if> value="Mrs.">Master</option>
										<option <c:if test="${patient.title=='Dr.'}">selected=selected</c:if> value="Dr.">Miss.</option>
								</select></td>
								<td><input name="firstName" required="required" type="text" value="${patient.firstName}" /></td>
								<td><input name="lastName" required="required" type="text" value="${patient.lastName}"/></td>
								<td><input name="middleName" type="text" value="${patient.middleName}" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="left">
					<td>Gender</td>
					<td>Age (Years/Month/Days)</td>
					<td>Referred by</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<select name="gender" required="required">
							<option value="">-select</option>
							<option <c:if test="${patient.gender=='Male'}">selected=selected</c:if> value="Male">Male</option>
							<option <c:if test="${patient.gender=='Female'}">selected=selected</c:if> value="Female">Female</option>
							<option <c:if test="${patient.gender=='Other'}">selected=selected</c:if> value="Other">Other</option>
						</select>
					</td>
					<td>
						<select name="year">
							<c:set var="year" value="0" scope="page" />
							<option value="0">-0 year -</option>
							<% for(int i = 0; i < 120; i++) { %>
						       <option value="<%=i%>" ${year == patient.year ? 'selected' : ''}><%=i%> year </option>
								<c:set var="year" value="${year + 1}"/>
						    <% } %>
						</select>
						<select name="month">
							<c:set var="month" value="0" scope="page" />
							<% for(int i = 0; i < 11; i++) { %>
						       <option value="<%=i%>" ${month == patient.month ? 'selected' : ''}><%=i%> month </option>
						    	<c:set var="month" value="${month + 1}"/>
						    <% } %>
						</select>
						<select name="day">
							<c:set var="day" value="0" scope="page" />
							<% for(int i = 0; i < 364; i++) { %>
						        <option value="<%=i%>" ${i == patient.day ? 'selected' : ''}><%=i%> day </option>
						        <c:set var="day" value="${day + 1}"/>
						    <% } %>
						</select>
					</td>
					<td>
						<select name="referredBy" required="required">
							<option value="">-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option <c:if test="${patient.referredBy==doctor.id}">selected=selected</c:if> value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td></td>
				</tr>
		
				<tr>
					<td>Blood Group</td>
					<td>Weight (Kgs.)</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		
				<tr>
					<td>
						<input name="bloodGroup" style="width: 85px" type="text" value="${patient.bloodGroup}" />
					</td>
					<td><input name="weight" type="text" value="${patient.weight}"/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td>Address</td>
					<td>
						<textarea name="address" style="width: 189px; height: 42px">${patient.address}</textarea>
					</td>
					<td>Contact Info</td>
					<td>&nbsp;<input name="contactInfo" type="text" value="${patient.contactInfo}"/></td>
				</tr>
				<tr>
					<td>Add1</td>
					<td>
						<textarea cols="20" name="address1" rows="1" style="width: 189px; height: 42px">${patient.address1}</textarea>
					</td>
					<td>Tel.No (Home)</td>
					<td>&nbsp;<input name="telephone" type="text" value="${patient.telephone}"/></td>
				</tr>
				<tr>
					<td>Add2</td>
					<td>
						<textarea cols="20" name="address2" rows="1" style="width: 189px; height: 42px">${patient.address2}</textarea>
					</td>
					<td>Mobile No.</td>
					<td>&nbsp;<input name="mobile" type="text" value="${patient.mobile}"/></td>
				</tr>
				<tr>
					<td>Add3</td>
					<td>
						<textarea cols="20" name="address3" rows="1"
							style="width: 189px; height: 42px">${patient.address3}</textarea>
					</td>
					<td>Email</td>
					<td>&nbsp;<input name="email" type="text" value="${patient.email}"/></td>
				</tr>
				<tr>
					<td>Area</td>
					<td><input name="area" type="text" /></td>
					<td>City</td>
					<td><input name="city" type="text" value="${patient.city}"/></td>
				</tr>
				<tr>
					<td>District</td>
					<td><input name="district" type="text" value="${patient.district}"/></td>
					<td>Zip</td>
					<td><input name="zip" type="text" value="${patient.zip}"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input name="state" type="text" value="${patient.state}"/></td>
					<td>Country</td>
					<td><input name="country" type="text" value="${patient.country}"/></td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
						<input name="action" type="submit" value="update" />&nbsp;&nbsp;&nbsp;
						<input name="reset" type="reset" value="reset" />
					</td>
				</tr>
		
			</table>
		</form>
<jsp:include page="../theme/parts/footer.jsp" />