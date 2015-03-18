<%@page import="com.app.framework.Auth"%>
<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />

	<form name="ipd" method="post" action="ipd" >
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td  align="center" colspan="3" ><strong>IPD Registration</strong></td>
			</tr>
			<tr>
				<td align="center"><strong>Admission No</strong></td>
				<td>
					<input type="text" name="admissionId" value="" placeholder="OPD Admission no" required/>
					<input type="submit" name="action" value="load" />
				</td>
			</tr>
		</table>
	</form>
	<form name="ipd" method="post" action="ipd">
		<input type="hidden" name="patientId" value="${opd.patient.id}" />
		<input type="hidden" name="admissionId" value="${opd.admissionId}" />
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td colspan="3"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
			<tr>
				<td colspan="3"><h4 style="color:red;">${msg}</h4></td>
			</tr>
			<tr>
				<td>Staff Name&nbsp;&nbsp;&nbsp; <input name="staffName" type="text" readonly="readonly" value="<%= Auth.getLoggedStaffName(request) %>"/></td>
				<td style="width: 180px">&nbsp;</td>
				<td>&nbsp;Date Time&nbsp;&nbsp;&nbsp; <input readonly="readonly" name="entryDate" type="text" value="<%= DateTimeUtil.getCurrentDate() %>" /></td>
			</tr>
			<tr>
				<td style="width: 69px">&nbsp;</td>
				<td>&nbsp;</td>
				<td style="width: 180px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Patient Reg No</td>
				<td>Patient Reg Date</td>
				<td>Contact Info</td>
			</tr>
			<tr>
				<td><input readonly type="text" value="${opd.patient.registrationNo}"/></td>
				<td><input readonly type="text" value="${opd.patient.registrationDate}" /></td>
				<td><input readonly type="text" value="${opd.patient.contactInfo}" /></td>
			</tr>
			<tr>
				<td>Patient Name </td>
				<td>Age</td>
				<td>&nbsp</td>
			</tr>
			<tr>
				<td><input readonly type="text" value="${opd.patient.firstName}" /></td>
				<td><input readonly type="text" value="${opd.patient.birthDate}" /></td>
				<td>&nbsp</td>
			</tr>
			<tr>
				<td>OPD Date</td>
				<td>OPD Doctor</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><input readonly type="text" value="${opd.entryDate}"/></td>
				<td><input readonly type="text" value="${opd.doctor.name}"/></td>
				<td>&nbsp;</td>
			</tr>
				
				<tr>
					<td colspan="3"><hr class="auto-style1" style="width: 100%" /></td>
				</tr>
			
				<tr>
					<td style="width: 69px">Admission ID</td>
					<td>Admission Date</td>
					<td style="width: 180px">Admission Time</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px"><input name="admissionId" type="text" readonly  value="${opd.admissionId}"/></td>
					<td><input name="admissionDate" required id="admissionDate" type="text"/></td>
					<td style="width: 180px"><input name="admissionTime" id="admissionTime" type="text" /></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Admission Type</td>
					<td>Admitting Doctor</td>
					<td style="width: 180px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">
						<select name="admissionTypeId" required="required">
							<option value="">-select-</option>
							<c:forEach items="${admissionTypelist}" var="admissionType">
								<option value="${admissionType.id}">${admissionType.name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name="doctorId" required="required">
							<option value="">-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td style="width: 180px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Ward</td>
					<td>Bed No.</td>
					<td style="width: 180px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">
						<select name="ward" required="required">
							<option value="">-select-</option>
							<c:forEach items="${wardlist}" var="ward">
								<option value="${ward.id}">${ward.name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<input name="bedNo" type="text" />
					</td>
					<td style="width: 180px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 180px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan=36"><hr class="auto-style1" style="width: 100%" /></td>
				</tr>
			
				<tr>
					<td>Admission Diagnosis</td>
					<td>Admission Details</td>
					<td>Suggested Treatment</td>
				</tr>
				<tr>
					<td>
					<textarea name="admissionDiagnosis" rows="1" style="width: 259px; height: 121px"></textarea></td>
					<td>
					<textarea name="admissionDetail" rows="1" style="width: 203px; height: 121px"></textarea></td>
					<td>
					<textarea name="admissionTreatment" rows="1" style="width: 211px; height: 121px"></textarea></td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td>Allergy Details</td>
					<td colspan="2">Special Notes</td>
				</tr>
				<tr>
					<td>
						<textarea cols="20" name="allergyDetail" rows="1" style="width: 261px; height: 121px"></textarea>
					</td>
					<td colspan="4">
						<textarea name="specialNote" rows="1" style="width: 437px; height: 121px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Advance Payment</td>
					<td><input name="advancePayment" type="number" step="any" type="text" /></td>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Remarks</td>
					<td colspan="3">
						<textarea name="remark" rows="1" style="width: 389px; height: 121px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="100%"><hr class="auto-style1" style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">
					<input name="action" type="submit" value="add" />&nbsp;&nbsp;&nbsp;
					<input name="Reset1" type="reset" value="reset" /></td>
				</tr>
				<tr>
					<td colspan="100%">&nbsp;</td>
				</tr>
			</table>
		</form>
		<script>
			Calendar.setup({
	            trigger    : "admissionDate",
	            inputField : "admissionDate",
	            dateFormat: "%d-%m-%Y"
	        });
	        $(function(){
	        	$('#admissionTime').clockpick({starthour : 0, endhour : 24 }); 
			});
		</script>
<jsp:include page="../theme/parts/footer.jsp" />


							