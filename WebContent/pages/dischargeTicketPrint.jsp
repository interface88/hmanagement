<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />
			<table style="width: 93%" class="tdright">
				<tr>
					<td align="center" colspan="4">Patient Discharge</td>
				</tr>
				<tr>
					<td>Staff Name</td>
					<td>${dischargeTicket.staffName}</td>
					<td>Entry Date</td>
					<td>${dischargeTicket.entryDate}</td>
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
								<td>${dischargeTicket.patient.firstName} ${dischargeTicket.patient.lastName}</td>
								<td>${dischargeTicket.ipd.admissionDate}</td>
								<td>${dischargeTicket.ipd.ward}</td>
								<td>${dischargeTicket.ipd.bedNo}</td>
								<td>${dischargeTicket.doctor.name}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4">
					</td>
				</tr>
				<tr>
					<td colspan="4">Treatment Note</td>
				</tr>
				<tr>
					<td>${dischargeTicket.treatmentNote}</td>
				</tr>
				<tr>
					<td colspan="4">Discharge Note</td>
				</tr>
				<tr>
					<td>${dischargeTicket.dischargeNote}</td>
				</tr>
				<tr>
					<td colspan="4">Advise</td>
				</tr>
				<tr>
						<td>${dischargeTicket.advice}</td>
				</tr>
				<tr>
					<td colspan="4">Condition of Patient at discharge</td>
				</tr>
				<tr>
					<td>${dischargeTicket.conditionOfPatient}</td>
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
						<!-- 	<tr>
								<td ><input type="text" name="pressure" style="width:100px" /></td>
								<td ><input type="text" name="pulse" style="width:100px"/></td>
								<td ><input type="text" name="temperature" style="width:100px"/></td>
								<td ><input type="text" name="sugar" style="width:100px"/></td>
								<td ><input type="text" name="weight" style="width:100px"/></td>
								<td ><input type="text" name="examingTime" style="width:100px"/></td>
								<td ><input type="text" name="remark" style="width:200px"/></td>
							</tr>

 -->							<tr>
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
				<tr >
						<td>${dischargeTicket.prescribedMedicine}</td>
				</tr>
				<tr>
					<td colspan="4">
						<table>
							<thead>
								<tr>
									<td>Sno</td>
									<td>Name</td>
									<td>Dosage</td>
									<td>Time</td>
									<td>Remark</td>
									<td></td>
								</tr>
							</thead>
						<!--  	<tbody id="medicineTableData">
								<tr>
									<td>1</td>
									<td>
										<select class="medicine">
											<option value="">-select-</option>
											<c:forEach items="${medicinelist}" var="medicine">
												<option value="${medicine.id}">${medicine.name}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" class="medicineDosage">
									</td>
									<td>
										<input type="text" class="medicineTime">
									</td>
									<td>
										<textarea class="medicineRemark"></textarea>
									</td>
									<td class="medicineBtnRow">
										<input type="button" value="Add" onclick="addMedicine();" >
									</td>
								</tr>
							</tbody>
							-->
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4">Follow up Schedule</td>
				</tr>
				<tr>
					<td>${dischargeTicket.followUpSchedule}</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="width: 100%" /></td>
				</tr>
			</table>
<jsp:include page="../theme/parts/footerReport.jsp" />
