<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<form name="nursing" method="post" action="nursing">
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
	<script>
		// function to add medicine row
		function addMedicine(){
			var medicineRow = $('#medicineTable .medicineRow:first').clone();

			// replacing add button with delete button.
			medicineRow.find('.btn').html('<input type="button" class="delete" value="Delete">'); 
			$('#medicineTable').append(medicineRow);
			
		}
		// function to add test row
		function addTest(){
			var medicineRow = $('#testTable .testRow:first').clone();

			// replacing add button with delete button.
			medicineRow.find('.btn').html('<input type="button" class="delete" value="Delete">'); 
			$('#testTable').append(medicineRow);
			
		}
		$(function(){
			// --------- code to delete medicine row----------
			$('#medicineTable ').on('click','.delete',function(){
				$(this).parent().parent().remove();
			});

			// --------- code to delete test row----------
			$('#testTable ').on('click','.delete',function(){
				$(this).parent().parent().remove();
			});
			
		});

		function readData(){

			// -------- code to read medicine price ----
			var medicineRate = 0;
			$('.medicineRow').each(function(){
				var rate = $(this).find('.medicinePrice').val();
				medicineRate = parseFloat(rate) + parseFloat(medicineRate);
			})

			$('#medicineTotalPrice').val(medicineRate);


			// -------- code to read test price ----
			var testRate = 0;
			$('.testRow').each(function(){
				var rate = $(this).find('.testPrice').val();
				testRate = parseFloat(rate) + parseFloat(testRate);
			})

			$('#testTotalPrice').val(testRate);
		}
		
	</script>
	<form name="nursing" method="post" action="nursing">
		<input type="text" name="patientId" value="${ipd.patient.id}" />
		<input type="text" name="admissionId" value="${ipd.admissionId}" />
		<input type="text" id="medicineTotalPrice" name="medicineTotalPrice" value="0" />
		<input type="text" id="testTotalPrice" name="testTotalPrice" value="0" />
		
		<table style="width: 93%" cellpadding="3px;">
			<tr>
				<td align="center" colspan="6"><strong>Nursing Module</strong></td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
	
			<tr>
				<td>Staff Name</td>
				<td style="width: 130px">
					<input name="staffName" type="text" value="" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Entry Date Time</td>
				<td><input name="nursingDate" type="text" value="" style="width: 120px" /></td>
			</tr>
			<tr>
				<td style="height: 23px">Patient Id</td>
				<td style="width: 130px; height: 23px">Patient name</td>
				<td style="height: 23px">Date</td>
				<td style="height: 23px">Time</td>
				<td style="height: 23px">Doctor</td>
				<td style="height: 23px">no. of visit</td>
			</tr>
			<tr>
				<td><input disabled style="width: 110px" type="text" value=""/></td>
				<td style="width: 130px"><input disabled type="text" value=""/></td>
				<td><input disabled type="text" value=""/></td>
				<td><input disabled type="text" value=""/></td>
				<td>
					<select name="doctorId">
						<option>-select-</option>
						<c:forEach items="${doctorlist}" var="doctor">
							<option value="${doctor.id}">${doctor.name}</option>
						</c:forEach>
					</select>
				</td>
				<td><input name="noOfVisit" type="text" style="width: 120px" /></td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
			<tr>
				<td><strong>Examing</strong></td>
				<td style="width: 130px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="tdbackstyle1">
				<td>Pressure (mmHg)</td>
				<td style="width: 130px">Pulse(BMP)</td>
				<td>Temp(~F)</td>
				<td>Suger</td>
				<td>Time</td>
				<td>Remark</td>
			</tr>
			<tr>
				<td><input name="pressure" type="text" style="width: 110px" /></td>
				<td style="width: 130px"><input name="pulse" type="text" /></td>
				<td><input name="temperature" type="text" /></td>
				<td><input name="sugar" type="text" /></td>
				<td><input name="examingTime" type="text" /></td>
				<td>
					<textarea name="remark" style="width: 95%; height: 35px" cols="20" rows="1"></textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="width: 130px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td style="width: 130px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
			<tr>
				<td style="height: 30px"><strong>Medicine</strong></td>
				<td style="width: 130px; height: 30px;"></td>
				<td style="height: 30px"></td>
				<td style="height: 30px"></td>
				<td style="height: 30px"></td>
				<td style="height: 30px"></td>
			</tr>
			<tr>
				<td colspan="6">
					<table style="width: 100%" class="tdbackstyle1" id="medicineTable">
						<tr class="tdbackstyle1">
							<td style="width: 62px; height: 31px"><strong>S.No</strong></td>
							<td style="width: 182px; height: 31px"><strong>Name</strong></td>
							<td style="width: 131px; height: 31px"><strong>Dosage</strong></td>
							<td style="width: 123px; height: 31px"><strong>Time</strong></td>
							<td style="height: 31px; width: 300px"><strong>Remarks</strong></td>
							<td style="height: 31px">&nbsp;</td>
						</tr>
						<tr valign="top" class="medicineRow">
							<td style="height: 29px; width: 62px"></td>
							<td style="height: 29px; width: 182px">
								<select class="medicinePrice">
									<c:forEach items="${medicinelist}" var="medicine">
										<option value="${medicine.rate}">${medicine.name}</option>
									</c:forEach>
								</select>
							</td>
							<td style="height: 29px; width: 131px">
								<input name="Text15" type="text" />
							</td>
							<td style="height: 29px; width: 123px">
								<input name="Text16" type="text" />
							</td>
							<td style="height: 29px; width: 300px">
								<textarea name="TextArea1" style="width: 95%; height: 35px"></textarea>
							</td>
							<td style="height: 29px" align="center" valign="middle" class="btn">
								<input type="button" value="Add" onclick="addMedicine();" />
							</td>
						</tr>
					</table>
	
				</td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
			<tr>
				<td style="height: 30px"><strong>Test</strong></td>
				<td style="width: 130px; height: 30px;"></td>
				<td style="height: 30px"></td>
				<td style="height: 30px"></td>
				<td style="height: 30px"></td>
				<td style="height: 30px"></td>
			</tr>
			<tr>
				<td colspan="6">
					<table style="width: 100%" class="tdbackstyle1" id="testTable">
						<tr>
							<td style="width: 62px; height: 31px"><strong>S.No</strong></td>
							<td style="width: 182px; height: 31px"><strong>Type</strong></td>
							<td style="width: 131px; height: 31px"><strong>Name</strong></td>
							<td style="width: 123px; height: 31px"><strong>Time</strong></td>
							<td style="height: 31px; width: 300px"><strong>Remarks</strong></td>
							<td style="height: 31px">&nbsp;</td>
						</tr>
						<tr valign="top" class="testRow">
							<td style="height: 39px; width: 62px"></td>
							<td style="height: 39px; width: 182px"><select
								class="ddlmidium" name="Select5">
									<option></option>
							</select></td>
							<td style="height: 39px; width: 131px">
								<select class="testPrice"  name="Select6">
									<c:forEach items="${testlist}" var="test">
										<option value="${test.rate}">${test.name}</option>
									</c:forEach>
								</select>
							</td>
							<td style="height: 39px; width: 123px">
								<input name="Text18" type="text" /></td>
							<td style="height: 39px; width: 266px">
								<textarea name="TextArea1" style="width: 95%; height: 35px"></textarea>
							</td>
							<td style="height: 29px" align="center" valign="middle" class="btn">
								<input type="button" value="Add" onclick="addTest();" />
							</td>
						</tr>
					</table>
	
				</td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
			</tr>
	
			<tr>
				<td colspan="6" align="right">
					<input name="action" type="submit" value="save" />&nbsp;&nbsp;&nbsp;
					<input type="button" value="TEST" onclick="readData();" />&nbsp;&nbsp;&nbsp;  
					<input name="Reset1" type="reset" value="reset" /></td>
			</tr>
			<tr>
				<td colspan="6">&nbsp;</td>
			</tr>
		</table>
	
	</form>
<jsp:include page="../theme/parts/footer.jsp" />
