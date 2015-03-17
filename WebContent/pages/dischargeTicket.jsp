<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<form name="dischargeTicketForm" method="post" action="dischargeTicket">
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td colspan="4"><h4 style="color:red;">${msg}</h4></td>
			</tr>
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
			<input type="hidden" name="patientId" value="${ipd.patient.id}" />
			<input type="hidden" name="admissionId" value="${ipd.admissionId}" />
			<input type="hidden" name="ipdId" value="${ipd.id}" />
			<table style="width: 93%" class="tdright">
				<tr>
					<td align="center" colspan="4">Patient Discharge</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td>Staff Name</td>
					<td><input name="staffName" type="text" readonly="readonly" value="${dischargeTicket.staffName}"/></td>
					<td>Entry Date</td>
					<td><input name="entryDate" type="text" readonly="readonly" value="<%=DateTimeUtil.getCurrentDate()%>"/></td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4">
						<table style="width: 100%;">
							<tr class="tdbackstyle1">
								<td>Patient name</td>
								<td>Adm. Date</td>
								<td>Ward</td>
								<td>Bed</td>
								<td>Discharge Doctor</td>
							</tr>
							<tr>
								<td><input readonly="readonly" style="width:200px" type="text" value="${ipd.patient.firstName} ${ipd.patient.lastName}"/></td>
								<td><input readonly="readonly" type="text" style="width:100px" value="${ipd.admissionDate}"/></td>
								<td><input readonly="readonly" type="text" style="width:50px" value="${ipd.ward}"/></td>
								<td><input readonly="readonly" type="text" style="width:50px" value="${ipd.bedNo}"/></td>
								<td>
									<select name="doctorId" required="required">
										<option value="">-select-</option>
										<c:forEach items="${doctorlist}" var="doctor">
											<option value="${doctor.id}">${doctor.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4">
					</td>
				</tr>
				<tr>
					<td colspan="4">Treatment Note</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="treatmentNote" required="required"
							maxlength="300" style="width: 582px; height: 83px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">Discharge Note</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="20" name="dischargeNote" required="required" rows="1"
							maxlength="300" style="width: 582px; height: 83px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">Advise</td>
				</tr>
				<tr>
					<td colspan="4" style="height: 23px">
						<textarea cols="20" maxlength="300"
							name="advice" required="required" rows="1" style="width: 582px; height: 83px"></textarea>
						</td>
				</tr>
				<tr>
					<td colspan="4">Condition of Patient at discharge</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="20"maxlength="300"  name="conditionOfPatient" required="required" maxlength="300" rows="1"
							style="width: 582px; height: 83px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4">Examining on Discharge</td>
				</tr>
				<tr>
					<td colspan="4">
						<table class="tdbackstyle1">
							<tr>
								<td >Pressure (mm/Hg)</td>
								<td >Pulse (BMP)</td>
								<td >Temp. (~F)</td>
								<td >Sugar</td>
								<td >Weight (kg)</td>
								<td >Time</td>
								<td>Remark</td>
							</tr>
							<tr>
								<td ><input type="text" name="pressure" style="width:100px" /></td>
								<td ><input type="text" name="pulse" style="width:100px"/></td>
								<td ><input type="text" name="temperature" style="width:100px"/></td>
								<td ><input type="text" name="sugar" style="width:100px"/></td>
								<td ><input type="text" name="weight" style="width:100px"/></td>
								<td ><input type="text" name="examingTime" style="width:100px"/></td>
								<td ><input type="text" name="remark" style="width:200px"/></td>
							</tr>
							<tr>
								<td >&nbsp;</td>
								<td >&nbsp;</td>
								<td >&nbsp;</td>
								<td >&nbsp;</td>
								<td >&nbsp;</td>
								<td >&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4">Prescribed Medicine</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="20" name="prescribedMedicine" rows="1"
							style="width: 582px; height: 83px"></textarea>
						</td>
				</tr>
				<tr>
					<td colspan="4">Follow up Schedule</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="20" name="followUpSchedule" rows="1"
							style="width: 582px; height: 83px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: right;">
						<input name="action" type="submit" value="submit" />&nbsp;&nbsp;&nbsp; 
						<input name="Reset1" type="reset" value="reset" />
					</td>
				</tr>
			</table>
		
		</form>
<jsp:include page="../theme/parts/footer.jsp" />
