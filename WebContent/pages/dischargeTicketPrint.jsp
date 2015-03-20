<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />
		<h3 class="clearfix">Patient Discharge Report</h3>
		<textarea style="display:none;" id="prescribedMedicine">${dischargeTicket.prescribedMedicine}</textarea>
		<table style="width: 93%" class="tdright">
			<tr>
				<td class="strong">Staff Name</td>
				<td><code>${dischargeTicket.staffName}</code></td>
				<td class="strong">Entry Date</td>
				<td><code>${dischargeTicket.entryDate}</code></td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="4">
					<table style="width: 100%;">
						<tr class="tdbackstyle1">
							<td class="strong">Patient name</td>
							<td class="strong">Adm. Date</td>
							<td class="strong">Ward</td>
							<td class="strong">Bed</td>
							<td class="strong">Discharge Doctor</td>
						</tr>
						<tr>
							<td><code>${dischargeTicket.patient.firstName} ${dischargeTicket.patient.lastName}</code></td>
							<td><code>${dischargeTicket.ipd.admissionDate}</code></td>
							<td><code>${dischargeTicket.ipd.ward}</code></td>
							<td><code>${dischargeTicket.ipd.bedNo}</code></td>
							<td><code>${dischargeTicket.doctor.name}</code></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="4" class="strong">Treatment Note</td>
			</tr>
			<tr>
				<td colspan="4"><code>${dischargeTicket.treatmentNote}</code></td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="4" class="strong">Discharge Note</td>
			</tr>
			<tr>
				<td colspan="4"><code>${dischargeTicket.dischargeNote}</code></td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="4" class="strong">Advise</td>
			</tr>
			<tr>
				<td colspan="4"><code>${dischargeTicket.advice}</code></td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="4" class="strong">Condition of Patient at discharge</td>
			</tr>
			<tr>
				<td>${dischargeTicket.conditionOfPatient}</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td colspan="4" class="strong">Examining on Discharge</td>
			</tr>
			<tr>
				<td colspan="4">
					<table class="tdbackstyle1">
						<tr>
							<td class="strong">Pressure (mm/Hg)</td>
							<td class="strong">Pulse (BMP)</td>
							<td class="strong">Temp. (~F)</td>
							<td class="strong">Sugar</td>
							<td class="strong">Weight (kg)</td>
							<td class="strong">Time</td>
							<td class="strong">Remark</td>
						</tr>
						<tr>
							<td><code>${dischargeTicket.pressure}</code></td>
							<td><code>${dischargeTicket.pulse}</code></td>
							<td><code>${dischargeTicket.temperature}</code></td>
							<td><code>${dischargeTicket.sugar}</code></td>
							<td><code>${dischargeTicket.weight}</code></td>
							<td><code>${dischargeTicket.examingTime}</code></td>
							<td><code>${dischargeTicket.remark}</code></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td class="strong" colspan="4">Prescribed Medicine</td>
			</tr>
			<tr>
				<td colspan="4">
					<table class="tdbackstyle1">
						<thead>
							<tr>
								<th>Sno</th>
								<th>Name</th>
								<th>Dosage</th>
								<th>Time</th>
								<th>Remark</th>
							</tr>
						</thead>
						<tbody id="medicineTable">
						
						</tbody>
					</table>
				</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td class="strong" colspan="4">Follow up Schedule</td>
			</tr>
			<tr>
				<td><code>${dischargeTicket.followUpSchedule}</code></td>
			</tr>
			<tr>
				<td colspan="2" style="padding:50px; ">
					<span style="float: left;">Doctor Sign</span>
				</td>
				<td colspan="2" style="padding:50px; ">
					<span style="float: right;">Patient/Relative Sign</span>
				</td>
			</tr>
		</table>
		<script>
			var prescribedMedicine = document.getElementById('prescribedMedicine').value;
			var prescribedMedicineObj_arr = eval(prescribedMedicine);

			for(var i = 0; i< prescribedMedicineObj_arr.length; i++){
				var prescribedMedicineObj = prescribedMedicineObj_arr[i];

				var row = '<tr>'
							+ '<td>' + prescribedMedicineObj.sno  +'</td>'
							+ '<td>' + prescribedMedicineObj.medicine +'</td>'
							+ '<td>' + prescribedMedicineObj.medicineDosage +'</td>'
							+ '<td>' + prescribedMedicineObj.medicineTime +'</td>'
							+ '<td>' + prescribedMedicineObj.medicineRemark +'</td>'
						+ '</tr>'; 

				$('#medicineTable').append(row);
				
			}
		</script>
<jsp:include page="../theme/parts/footerReport.jsp" />
