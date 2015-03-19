<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<form name="dischargeTicketForm" method="post" action="dischargeTicket">
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td align="center" colspan="4"><strong>Patient Discharge</strong></td>
			</tr>
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
		<form name="dischargeTicketForm" class="smtxt" method="post" action="dischargeTicket" onsubmit="readData();">
			<input type="hidden" name="patientId" value="${ipd.patient.id}" />
			<input type="hidden" name="admissionId" value="${ipd.admissionId}" />
			<input type="hidden" name="ipdId" value="${ipd.id}" />
			<table style="width: 93%" class="tdright">
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
								<td ><input type="text" name="remark" /></td>
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
				<tr style="display:none;">
					<td colspan="4">
						<textarea cols="20" name="prescribedMedicine" id="prescribedMedicine" rows="1" style="width: 582px; height: 83px"></textarea>
					</td>
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
							<tbody id="medicineTableData">
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
						</table>
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
		<script>
			// function to add medicine row
			function addMedicine(){
				var medicineRow = $('#medicineTableData tr:first').clone();
	
				// replacing add button with delete button.
				medicineRow.find('.medicineBtnRow').html('<input type="button" class="delete" value="Delete">'); 
				$('#medicineTableData').append(medicineRow);
				updateMedicineRowSerialNo();
				
			}

			function updateMedicineRowSerialNo(){
				var count = 1;
				$('#medicineTableData tr').each(function(){
					$(this).find('td:first').html(count);
					count++;
				});
			}

			function readData(){

				var final_data = "";
				// -------- code to read medicine ----
				$('#medicineTableData tr').each(function(){
					var medicine = $(this).find('.medicine').val();
					if(medicine != ''){
						var medicineDosage = $(this).find('.medicineDosage').val();
						var medicineTime = $(this).find('.medicineTime').val();
						var medicineRemark = $(this).find('.medicineRemark').val();
	
						final_data = final_data + medicine + ',' + medicineDosage + ',' + 
						medicineTime+ ',' + medicineRemark + '\n' ;
					}

				});
				$('#prescribedMedicine').val(final_data);
			}

			// --------- code to delete medicine row----------
			$('#medicineTableData ').on('click','.delete',function(){
				$(this).parent().parent().remove();
				updateMedicineRowSerialNo();
			});
		</script>
<jsp:include page="../theme/parts/footer.jsp" />
