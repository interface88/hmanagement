<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<form name="finalBillLoadForm" method="post" action="finalBill">
		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td align="center" colspan="2">
					<strong>Final Bill</strong>
				</td>
			</tr>
			<tr>
				<td colspan="2"><h4 style="color:red;">${msg}</h4></td>
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
	<form name="finalBillForm" method="post" action="finalBill">
		<input type="hidden" name="ipdId" value="${ipd.id}" />
		<input type="hidden" name="patientId" value="${ipd.patient.id}" />
		<input type="hidden" name="admissionId" value="${ipd.admissionId}" />
		<input type="hidden" name="doctorId" value="${ipd.doctor.id}" />
		<input type="hidden" name="admissionTypeId" value="${ipd.admissionType.id}" />
		<table style="width: 90%" class="tdright smtxt" cellpadding="3px">
			<tr>
				<td colspan="6">
					<hr class="auto-style1" style="width: 100%" />
				</td>
			</tr>
			<tr>
				<td style="width: 128px">Staff Name</td>
				<td><input name="staffName" readonly="readonly" type="text" value="${finalBill.staffName}"/></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Entry Date</td>
				<td><input name="entryDate" type="text" readonly="readonly" value="<%=DateTimeUtil.getCurrentDate()%>" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td>Adm. Type</td>
				<td>Adm. Date</td>
				<td>Dis. Date</td>
				<td>Adm. Doctor</td>
			</tr>
			<tr>
				<td><input disabled="disabled" type="text" value="${ipd.patient.firstName} ${ipd.patient.lastName}"/></td>
				<td><input disabled="disabled" type="text" value="${ipd.admissionType.name}"/></td>
				<td><input disabled="disabled" style="width: 104px" type="text" value="${ipd.admissionDate}"/></td>
				<td><input name="dischargeDate" id="dischargeDate" type="text" required="required" style="width: 99px" /></td>
				<td><input disabled="disabled" type="text" value="${ipd.doctor.name}"/></td>
			</tr>
			<tr>
				<td colspan="6">
					<hr class="auto-style1" style="width: 100%" />
				</td>
			</tr>
			<tr>
				<td style="width: 128px">Bill No.</td>
				<td><input type="text" name="billNo" required="required" maxlength="50"/> </td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="auto-style1">Bill Date</td>
				<td><input type="text" name="billDate" id="billDate" required="required" maxlength="10"/></td>
			</tr>
			<tr>
				<td colspan="6">
					<table style="width: 100%" class="tdbackstyle1">
						<tr>
							<td style="width: 342px; height: 23px;">
								<strong>Particular of Charges (Head of Billing)</strong>
							</td>
							<td style="width: 160px; height: 23px;">
								<strong>Transaction Date</strong>
							</td>
							<td style="width: 89px; height: 23px;"><strong>Rate</strong></td>
							<td style="width: 89px; height: 23px;"><strong>Qty./Days</strong></td>
							<td style="height: 23px"><strong>Amount</strong></td>
						</tr>
						<c:forEach items="${nursingList}" var="nursing">
							<c:forEach items="${nursing.nursingTransactions}" var="transaction">
								<tr>
									<td style="width: 342px">${transaction.treatment}</td>
									<td style="width: 160px">${nursing.nursingDate}</td>
									<td style="width: 89px">&nbsp;</td>
									<td style="width: 89px">&nbsp;</td>
									<td style="width: 89px">${transaction.treatmentCost}</td>
								</tr>
		
								<c:set var="totalGross" value="${totalGross + transaction.treatmentCost}"></c:set>						
							
							</c:forEach>
						</c:forEach>
							<tr>
								<td style="width: 342px">WARD CHARGES</td>
								<td style="width: 160px">${ipd.entryDate}</td>
								<td style="width: 89px">&nbsp;</td>
								<td style="width: 89px">&nbsp;</td>
								<c:set var="totalGross" value="${totalGross + totalWardCharges}"></c:set>
								<td style="width: 89px">${totalWardCharges}</td>
							</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr class="auto-style1" style="width: 100%" />
				</td>
			</tr>
			<tr>
				<td style="width: 128px">Payment Mode</td>
				<td>
					<select name="paymentMode">
						<option value="Cash">Cash</option>
						<option value="Cheque">Cheque</option>
					</select>
				</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Gross Total</td>
				<td><input style="text-align: right;" id="grossTotal" name="grossTotal" type="text" readonly="readonly" value="${totalGross}"/></td>
			</tr>
			<tr>
				<td style="width: 128px">Balance Received</td>
				<td><input style="text-align: right;" id="balanceReceiveAmount" name="balanceReceiveAmount" type="number" step="any" value="${totalGross - upToDateReceipt}" /></td>
				<td>Upto Date Receipt Amount</td>
				<td><input style="text-align: right;" id="finalReceiveAmount" name="finalReceiveAmount"type="text" readonly="readonly" value="${upToDateReceipt}" /></td>
				<td>Discount&nbsp; =</td>
				<td><input style="text-align: right;" id="discount" name="discount" type="number" step="any"  onblur="applyDiscountAndTax();"/></td>
			</tr> 
			<tr>
				<td style="width: 128px">Cheque No</td>
				<td style=""><input name="chequeNumber" type="text"/></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Tax&nbsp;&nbsp; =</td>
				<td><input style="text-align: right;" id="tax" name="tax" type="number" step="any" onblur="applyDiscountAndTax();"/> </td>
			</tr>
			<tr>
				<td style="width: 128px">Cheque Date</td>
				<td style=""><input name="chequeDate" type="text" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><strong>Net Amount</strong></td>
				<td style=""><input style="text-align: right;" id="netAmount" name="netAmount" type="text" readonly="readonly" value="${totalGross}" /></td>
			</tr>
			<tr>
				<td style="width: 128px">Bank</td>
				<td><input name="bank" type="text" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">Other Details</td>
				<td><input name="otherDetails" type="text" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">Remark</td>
				<td colspan="4" rowspan="3"><textarea name="remark"
						style="width: 517px; height: 63px"></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1"
						style="width: 100%" /></td>
			</tr>
			<tr>
				<td style="width: 128px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="2" class="auto-style2">
					<input name="action" type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;
					<input name="Reset1" type="reset" value="reset" />
				</td>

			</tr>
			<tr>
				<td style="width: 128px">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>

	</form>
<script>
	
	Calendar.setup({
	    trigger    : "dischargeDate",
	    inputField : "dischargeDate",
	    dateFormat: "%d-%m-%Y"
	});

	Calendar.setup({
	    trigger    : "billDate",
	    inputField : "billDate",
	    dateFormat: "%d-%m-%Y"
	});

	

	function applyDiscountAndTax(){
		var grossTotal = parseFloat(document.getElementById('grossTotal').value);

		var discount = document.getElementById('discount').value;
		var tax = document.getElementById('tax').value;


		// default value if no discount present
		if(discount.trim() == ''){
			discount = 0.0;
		}else{
			discount = parseFloat(discount);
		}

		if(tax.trim() == ''){
			tax = 0.0;
		}else{
			tax = parseFloat(tax);
		}


		var discountGrossTotal = grossTotal - discount; // applying discount on gross total.

		var netAmount = discountGrossTotal + tax ; // applying tax on gross total.

		var finalReceiveAmount = document.getElementById('finalReceiveAmount').value;
		if(finalReceiveAmount.trim() == ''){
			finalReceiveAmount = 0.0;
		}else{
			finalReceiveAmount = parseFloat(finalReceiveAmount);
		}
		
		document.getElementById('netAmount').value = netAmount;
		document.getElementById('balanceReceiveAmount').value = netAmount - finalReceiveAmount;
	}


</script>
<jsp:include page="../theme/parts/footer.jsp" />