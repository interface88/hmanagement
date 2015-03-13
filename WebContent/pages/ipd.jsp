<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />

	<form name="ipd" method="post" action="ipd">
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td align="center"><strong>Admission Id</strong></td>
				<td>
					<input type="text" name="admissionId" value="" required/>
					<input type="submit" name="action" value="load" />
				</td>
			</tr>
		</table>
	</form>
	<form name="ipd" method="post" action="ipd">
		<input type="text" name="patientId" value="${opd.patient.id}" />
		<input type="text" name="admissionId" value="${opd.admissionId}" />
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td  align="center" colspan="6" ><strong>IPD Registration</strong></td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
			<tr>
				<td colspan="2">Staff Name&nbsp;&nbsp;&nbsp; <input name="staffName" type="text" /></td>
				<td style="width: 180px">&nbsp;</td>
				<td colspan="3">&nbsp;Date Time&nbsp;&nbsp;&nbsp; <input name="txtdatetime" type="text" /></td>
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
					<td colspan="6">
						<table style="width: 97%;" cellpadding="2px">
							<tr>
								<td style="width: 87px">Patient Id</td>
								<td style="width: 130px">Admission Date</td>
								<td colspan="2">Emergency Contact No</td>
								<td rowspan="6">&nbsp;</td>
							</tr>
							<tr>
								<td style="width: 87px"><input name="txtpid" disabled type="text" value="${opd.patient.id}"/></td>
								<td style="width: 130px"><input name="txtadmissiontype" disabled type="text" /></td>
								<td colspan="2"><input name="txtemgcontact" disabled type="text" /></td>
							</tr>
							<tr>
								<td style="width: 87px">Patient Name </td>
								<td style="width: 130px">Age</td>
								<td colspan="2">Emergency Contact Name</td>
							</tr>
							<tr>
								<td style="width: 87px"><input name="txtpname" disabled type="text" value="${opd.patient.firstName}" /></td>
								<td style="width: 130px"><input name="txtage" disabled type="text" value="${opd.patient.firstName}" /></td>
								<td colspan="2"><input name="txtemgcontactname" disabled type="text" value="${opd.patient.contactInfo}"/></td>
							</tr>
							<tr>
								<td style="width: 87px">OPD Date</td>
								<td style="width: 130px">OPD Doctor</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="width: 87px"><input name="txtipddate" disabled type="text" value="${opd.doctor.name}"/></td>
								<td style="width: 130px"><input name="txtipddoctor" disabled type="text" value="${opd.entryDate}"/></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
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
					<td style="width: 69px"><input name="admissionId" type="text"  value="${opd.admissionId}"/></td>
					<td><input name="admissionDate" type="text"/></td>
					<td style="width: 180px"><input name="admissionTime" type="text" /></td>
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
						<select name="admissionTypeId">
							<option>-select-</option>
							<c:forEach items="${admissionTypelist}" var="admissionType">
								<option value="${admissionType.id}">${admissionType.name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name="doctorId">
							<option>-select-</option>
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
						<select name="ward">
							<option>-select-</option>
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
					<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
				</tr>
			
				<tr>
					<td colspan="2">Admission Diagnosis</td>
					<td colspan="2">Admission Details</td>
					<td colspan="2">Suggested Treatment</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="admissionDiagnosis" rows="1" style="width: 259px; height: 121px"></textarea></td>
					<td colspan="2">
					<textarea name="admissionDetail" rows="1" style="width: 203px; height: 121px"></textarea></td>
					<td colspan="2">
					<textarea name="admissionTreatment" rows="1" style="width: 211px; height: 121px"></textarea></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">Allergy Details</td>
					<td colspan="4">Special Notes</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea cols="20" name="allergyDetail" rows="1" style="width: 261px; height: 121px"></textarea>
					</td>
					<td colspan="4">
						<textarea name="specialNote" rows="1" style="width: 437px; height: 121px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Advance Payment</td>
					<td><input name="advancePayment" type="text" /></td>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Remarks</td>
					<td colspan="5" rowspan="4">
						<textarea name="remark" rows="1" style="width: 389px; height: 121px"></textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 69px">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">&nbsp;</td>
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

<jsp:include page="../theme/parts/footer.jsp" />


							