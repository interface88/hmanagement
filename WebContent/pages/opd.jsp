<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		<form name="opd" method="post" action="opd">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="6">
						<strong>OPD Registration</strong></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Staff Name</td>
					<td style=""><input name="staffName" type="text" readonly value="<%= Auth.getLoggedStaffName(request) %>"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Entry Date Time</td>
					<td style="">
						<input name="entryDate" readonly="readonly" type="text" value="<%= DateTimeUtil.getCurrentDate() %>" />
					</td>
				</tr>
				<tr>
					<td style="">Case Type</td>
					<td style=""><select name="caseType" id="caseType" onchange="showPatientRegNo()">
							<option value="NEW">New</option>
							<option value="OLD">Old</option>
					</select></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
				<tr>
					<td style="">Patient Reg No</td>
					<td style="">
						<input id="registrationNo" name="registrationNo" type="text" value="${patient.registrationNo}" />
						<input type="button" value="Load Patient" onclick="loadPatient();" id="loadPatientBtn">
					</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Registration Date</td>
					<td style=""><input name="registrationDate" id="registrationDate" type="text" value="${patient.registrationDate}" /></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr align="left">
					<td colspan="6">
						<table style="width: 77%">
							<tr>
								<td>Title</td>
								<td>First Name</td>
								<td>Surname</td>
								<td>Middle Name</td>
							</tr>
							<tr>
								<td><select name="title">
										<option value="-1">-Select-</option>
										<option value="Mr.">Mr.</option>
										<option value="Ms.">Mrs.</option>
										<option value="Mrs.">Master</option>
										<option value="Dr.">Miss.</option>
								</select></td>
								<td><input name="firstName" type="text" value="${patient.firstName}" /></td>
								<td><input name="lastName" type="text" value="${patient.lastName}"/></td>
								<td><input name="middleName" type="text" value="${patient.middleName}" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="left">
					<td style="">Gender</td>
					<td colspan="2" style="">Age (Years/Month/Days)</td>
					<td colspan="2" style="">Referred by</td>
					<td style="">&nbsp;</td>
				</tr>
				<tr>
					<td style=""><select name="gender">
							<option value="-1">-select</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
					</select></td>
					<td colspan="3" style="">
					<input type="text" name="birthDate" id="birthDate" value="${patient.birthDate}">
					</td>
					<td style="">
						<select name="referredBy">
							<option>-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td style=""></td>
				</tr>
		
				<tr>
					<td style="">Blood Group</td>
					<td style="">Weight (Kgs.)</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style=""></td>
					<td style=""></td>
				</tr>
		
				<tr>
					<td style="">
						<input name="bloodGroup" style="width: 85px" type="text" value="${patient.bloodGroup}" />
					</td>
					<td style=""><input name="weight" type="text" value="${patient.weight}"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Address</td>
					<td colspan="2"><textarea name="address"
							style="width: 189px; height: 42px">{patient.textarea}</textarea></td>
					<td colspan="2" style="">Contact Info</td>
					<td style="">&nbsp;<input name="contactInfo" type="text" value="${patient.contactInfo}"/></td>
				</tr>
				<tr>
					<td style="">Add1</td>
					<td colspan="2" style=""><textarea cols="20" name="address1"
							rows="1" style="width: 189px; height: 42px">${patient.address1}</textarea></td>
					<td colspan="2" style="">Tel.No (Home)</td>
					<td style="">&nbsp;<input name="telephone" type="text" value="${patient.telephone}"/></td>
				</tr>
				<tr>
					<td style="">Add2</td>
					<td colspan="2"><textarea cols="20" name="address2" rows="1"
							style="width: 189px; height: 42px">${patient.address2}</textarea></td>
					<td colspan="2" style="">Mobile No.</td>
					<td style="">&nbsp;<input name="mobile" type="text" value="${patient.mobile}"/></td>
				</tr>
				<tr>
					<td style="">Add3</td>
					<td colspan="2"><textarea cols="20" name="address3" rows="1"
							style="width: 189px; height: 42px">${patient.address3}</textarea></td>
					<td colspan="2" style="">Email</td>
					<td style="">&nbsp;<input name="email" type="text" value="${patient.email}"/></td>
				</tr>
				<tr>
					<td style="">Area</td>
					<td style=""><input name="area" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">City</td>
					<td style=""><input name="city" type="text" value="${patient.city}"/></td>
				</tr>
				<tr>
					<td style="">District</td>
					<td style=""><input name="district" type="text" value="${patient.district}"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Zip</td>
					<td style=""><input name="zip" type="text" value="${patient.zip}"/></td>
				</tr>
				<tr>
					<td style="">State</td>
					<td style=""><input name="state" type="text" value="${patient.state}"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Country</td>
					<td style=""><input name="country" type="text" value="${patient.country}"/></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style=""><strong>IPD Details</strong></td>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
				<tr>
					<td style="">Doctor Name</td>
					<td style="">
						<select name="doctorId">
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Consultation Fee</td>
					<td style=""><input name="consulationFee" type="text" /></td>
				</tr>
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">
						<input name="action" type="submit" value="save" />&nbsp;&nbsp;&nbsp;
						<input name="reset" type="reset" value="reset" /></td>
				</tr>
		
				<tr>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
			</table>
		</form>
		
		<!-- 		hidden form to load patient data -->
		<form name="loadPatientForm" action="opd" id="loadPatientForm" method="post">
			<input name="action" value="load" type="text" />
			<input name="patientRegistrationNo" id="patientRegistrationNo"  type="text" />
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