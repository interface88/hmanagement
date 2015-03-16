<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		<form name="opd" method="post" action="opd">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="4">
						<strong>OPD Registration</strong>
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td colspan="4"><h4 style="color:red;">${msg}</h4></td>
				</tr>
				<tr>
					<td>Staff Name</td>
					<td><input name="staffName" type="text" readonly value="<%= Auth.getLoggedStaffName(request) %>"/></td>
					<td>Entry Date Time</td>
					<td>
						<input name="entryDate" readonly="readonly" type="text" value="<%= DateTimeUtil.getCurrentDate() %>" />
					</td>
				</tr>
				<tr>
					<td>Case Type</td>
					<td>
						<select name="caseType" id="caseType" onchange="showPatientRegNo()">
							<option value="NEW">New</option>
							<option value="OLD">Old</option>
						</select>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Patient Reg No</td>
					<td>
						<input id="registrationNo" name="registrationNo" type="text" value="${patient.registrationNo}" />
						<input type="button" value="Load Patient" onclick="loadPatient();" id="loadPatientBtn">
					</td>
					<td>Registration Date</td>
					<td><input name="registrationDate" required="required" id="registrationDate" type="text" value="${patient.registrationDate}" /></td>
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
										<option value="Mr.">Mr.</option>
										<option value="Ms.">Mrs.</option>
										<option value="Mrs.">Master</option>
										<option value="Dr.">Miss.</option>
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
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
						</select>
					</td>
					<td>
						<input type="text" name="birthDate" required="required" id="birthDate" value="${patient.birthDate}">
					</td>
					<td>
						<select name="referredBy" required="required">
							<option value="">-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
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
					<td><strong>IPD Details</strong></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Doctor Name</td>
					<td>
						<select name="doctorId" required="required">
							<option value="">-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td>Consultation Fee</td>
					<td><input name="consulationFee" required="required" type="text" /></td>
				</tr>
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
						<input name="action" type="submit" value="save" />&nbsp;&nbsp;&nbsp;
						<input name="reset" type="reset" value="reset" />
					</td>
				</tr>
		
			</table>
		</form>
		
		<!-- 		hidden form to load patient data -->
		<form name="loadPatientForm" action="opd" id="loadPatientForm" method="post">
			<input name="action" value="load" type="hidden" />
			<input name="patientRegistrationNo" id="patientRegistrationNo"  type="hidden" />
		</form>
		<script>
			Calendar.setup({
	            trigger    : "birthDate",
	            inputField : "birthDate",
	            dateFormat: "%d-%m-%Y"
	        });
			Calendar.setup({
	            trigger    : "registrationDate",
	            inputField : "registrationDate",
	            dateFormat: "%d-%m-%Y"
	        });

			function showPatientRegNo(){
				var caseTypeVal = document.getElementById('caseType').value;
				if(caseTypeVal == "NEW"){
					document.getElementById('registrationNo').setAttribute('readonly', 'readonly');
					document.getElementById('loadPatientBtn').style.display = 'none';
				}else{
					document.getElementById('registrationNo').removeAttribute('readonly');
					document.getElementById('loadPatientBtn').style.display = 'block';
				}
			}

			function loadPatient(){
				document.getElementById('patientRegistrationNo').value =  document.getElementById('registrationNo').value;
				document.getElementById('loadPatientForm').submit();
			}
		</script>
<jsp:include page="../theme/parts/footer.jsp" />