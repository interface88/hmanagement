<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<form name="dischargeTicketForm" method="post" action="dischargeTicket">
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
		<form name="dischargeTicketForm" method="post" action="dischargeTicket">
			<input type="text" name="patientId" value="${ipd.patient.id}" />
			<input type="text" name="admissionId" value="${ipd.admissionId}" />
			<table style="width: 93%" class="tdright">
				<tr>
					<td align="center" colspan="6">Patient Discharge</td>
				</tr>
				<tr>
					<td colspan="6"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td>Staff Name</td>
					<td><input name="Text1" type="text" /></td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>Entry Date</td>
					<td><input name="Text2" type="text" /></td>
				</tr>
				<tr>
					<td colspan="6"><hr style="width: 100%" /></td>
				</tr>
				<tr class="tdbackstyle1">
					<td>Patient name</td>
					<td>Adm. Date</td>
					<td style="width: 128px">Ward</td>
					<td>Bed</td>
					<td>Discharge Doctor</td>
				</tr>
				<tr>
					<td><input name="patient" type="text" value="${patient.firstName} ${patient.lastName}"/></td>
					<td><input disabled="disabled" type="text" value="${ipd.admissionDate}"/></td>
					<td><input disabled="disabled" type="text" value="${ipd.ward}"/></td>
					<td><input disabled="disabled" type="text" value="${ipd.bedNo}"/></td>
					<td>
						<select name="doctorId">
							<option>-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="6"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td>Treatment Note</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="treatmentNote"
							style="width: 582px; height: 83px"></textarea></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Discharge Note</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="20" name="dischargeNote" rows="1"
							style="width: 582px; height: 83px"></textarea></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Advise</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4" style="height: 23px"><textarea cols="20"
							name="advice" rows="1" style="width: 582px; height: 83px"></textarea></td>
					<td style="height: 23px"></td>
					<td style="height: 23px"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">Condition of Patient at discharge</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="20" name="conditionOfPatient" rows="1"
							style="width: 582px; height: 83px"></textarea></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4">Examining on Discharge</td>
		
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6">
						<table style="width: 100%" class="tdbackstyle1">
							<tr>
								<td style="width: 114px">Pressure (mm/Hg)</td>
								<td style="width: 102px">Pulse (BMP)</td>
								<td style="width: 82px">Temp. (~F)</td>
								<td style="width: 98px">Sugar</td>
								<td style="width: 80px">Weight (kg)</td>
								<td style="width: 117px">Time</td>
								<td>Remark</td>
							</tr>
							<tr>
								<td style="width: 114px"><input type="text" name="pressure" /></td>
								<td style="width: 102px"><input type="text" name="pulse" /></td>
								<td style="width: 82px"><input type="text" name="temperature" /></td>
								<td style="width: 98px"><input type="text" name="sugar" /></td>
								<td style="width: 80px"><input type="text" name="weight" /></td>
								<td style="width: 117px"><input type="text" name="examingTime" /></td>
								<td style="width: 117px"><input type="text" name="remark" /></td>
							</tr>
							<tr>
								<td style="width: 114px">&nbsp;</td>
								<td style="width: 102px">&nbsp;</td>
								<td style="width: 82px">&nbsp;</td>
								<td style="width: 98px">&nbsp;</td>
								<td style="width: 80px">&nbsp;</td>
								<td style="width: 117px">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="width: 114px">&nbsp;</td>
								<td style="width: 102px">&nbsp;</td>
								<td style="width: 82px">&nbsp;</td>
								<td style="width: 98px">&nbsp;</td>
								<td style="width: 80px">&nbsp;</td>
								<td style="width: 117px">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td>Prescribed Medicine</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="20" name="prescribedMedicine" rows="1"
							style="width: 582px; height: 83px"></textarea></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Follow up Schedule</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td style="width: 128px">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="20" name="followUpSchedule" rows="1"
							style="width: 582px; height: 83px"></textarea></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
		
					<td colspan="2" style="text-align: right;"><input name="Submit1"
						type="submit" value="submit" />&nbsp;&nbsp;&nbsp; <input
						name="Reset1" type="reset" value="reset" /></td>
		
				</tr>
				<tr>
					<td colspan="4">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		
			</table>
		
		</form>
<jsp:include page="../theme/parts/footer.jsp" />
