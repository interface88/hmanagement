<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		<form name="opd" method="post" action="opd">
			<input type="hidden" name="id" value="${opd.id}">
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
					<td><input type="text" readonly value="${opd.staffName}"/></td>
					<td>Entry Date Time</td>
					<td>
						<input readonly="readonly" type="text" value="${opd.entryDate}" />
					</td>
				</tr>
				<tr>
					<td>Case Type</td>
					<td>
						<input readonly="readonly" type="text" value="${opd.caseType}" />
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Patient Reg No</td>
					<td>
						<input id="registrationNo" readonly="readonly" type="text" value="${opd.patient.registrationNo}" />
					</td>
					<td>Registration Date</td>
					<td>
						<input id="registrationNo" readonly="readonly" type="text" value="${opd.patient.registrationDate}" />
					</td>
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
								<td><input readonly="readonly" type="text" value="${opd.patient.title}" /></td>
								<td><input readonly="readonly" type="text" value="${opd.patient.firstName}" /></td>
								<td><input readonly="readonly" type="text" value="${opd.patient.lastName}"/></td>
								<td><input readonly="readonly"type="text" value="${opd.patient.middleName}" /></td>
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
						<input readonly="readonly"type="text" value="${opd.patient.gender}" />
					</td>
					<td>
						<input readonly="readonly"type="text" value="${opd.patient.year} year / ${opd.patient.month} month / ${opd.patient.day} day" />
					</td>
					
					<td>
						<input readonly="readonly"type="text" value="${opd.patient.referredBy}" />
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
						<input readonly="readonly"type="text" value="${opd.patient.bloodGroup}" />
					</td>
					<td>
						<input readonly="readonly"type="text" value="${opd.patient.weight}" />
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td>Address</td>
					<td>
						<textarea readonly="readonly" style="width: 189px; height: 42px">${opd.patient.address}</textarea>
					</td>
					<td>Contact Info</td>
					<td><input readonly="readonly"type="text" value="${opd.patient.contactInfo}" /></td>
				</tr>
				<tr>
					<td>Add1</td>
					<td>
						<textarea cols="20" readonly="readonly" rows="1" style="width: 189px; height: 42px">${opd.patient.address1}</textarea>
					</td>
					<td>Tel.No (Home)</td>
					<td>&nbsp;<input readonly="readonly" type="text" value="${opd.patient.telephone}"/></td>
				</tr>
				<tr>
					<td>Add2</td>
					<td>
						<textarea cols="20" readonly="readonly" rows="1" style="width: 189px; height: 42px">${opd.patient.address2}</textarea>
					</td>
					<td>Mobile No.</td>
					<td>&nbsp;<input readonly="readonly" type="text" value="${opd.patient.mobile}"/></td>
				</tr>
				<tr>
					<td>Add3</td>
					<td>
						<textarea cols="20" readonly="readonly" rows="1"
							style="width: 189px; height: 42px">${opd.patient.address3}</textarea>
					</td>
					<td>Email</td>
					<td>&nbsp;<input readonly="readonly" type="text" value="${opd.patient.email}"/></td>
				</tr>
				<tr>
					<td>Area</td>
					<td><input readonly="readonly" type="text" /></td>
					<td>City</td>
					<td><input readonly="readonly" type="text" value="${opd.patient.city}"/></td>
				</tr>
				<tr>
					<td>District</td>
					<td><input readonly="readonly" type="text" value="${opd.patient.district}"/></td>
					<td>Zip</td>
					<td><input readonly="readonly" type="text" value="${opd.patient.zip}"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input readonly="readonly" type="text" value="${opd.patient.state}"/></td>
					<td>Country</td>
					<td><input readonly="readonly" type="text" value="${opd.patient.country}"/></td>
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
						<select name="doctorId" required="required" onchange="loadConsulationFee(this.value);">
							<option value="">-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}" ${doctor.id == opd.doctor.id ? 'selected' : ''}>${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td>Consultation Fee</td>
					<td><input name="consulationFee" id="consulationFee" required="required" type="number" step="any" type="text" value="${opd.consulationFee}" /></td>
				</tr>
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
						<input name="action" type="submit" value="update" />&nbsp;&nbsp;&nbsp;
						<input name="reset" type="reset" value="reset" />
					</td>
				</tr>
		
			</table>
		</form>
		<script>
			function loadConsulationFee(doctorId){
				if(doctorId != ""){
					var url = 'doctor?action=doctorFee&id=' + doctorId;
					$.get(url, function(response){
						document.getElementById('consulationFee').value= response;
						
					});
				}else{
					document.getElementById('consulationFee').value='';
				}
			}
		</script>
<jsp:include page="../theme/parts/footer.jsp" />