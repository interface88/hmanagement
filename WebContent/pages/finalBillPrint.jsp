<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<table style="width: 90%" class="tdright" cellpadding="3px">
			<tr>
				<td align="center" colspan="6"><strong>Final
						Bill</strong></td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1"
						style="width: 100%" /></td>
			</tr>

			<tr>
				<td style="width: 128px">Staff Name</td>
				<td>${finalBill.staffName}</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Entry Date</td>
				<td>${finalBill.entryDate}</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>Adm. Type</td>
				<td>Adm. Date</td>
				<td>Dis. Date</td>
				<td>Adm. Doctor</td>
			</tr>
			<tr>
				<td>${ipd.patient.firstName} ${ipd.patient.lastName}</td>
				<td>${ipd.admissionType.name}</td>
				<td>${ipd.admissionDate}</td>
				<td>${finalBill.dischargeDate}</td>
				<td>${ipd.doctor.name}</td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1"
						style="width: 100%" /></td>
			</tr>
			<tr>
				<td style="width: 128px">Bill No.</td>
				<td>${finalBill.billNo}</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="auto-style1">Bill Date</td>
				<td>${finalBill.billDate}</td>
			</tr>
			<tr>
				<td colspan="6">
					<table style="width: 100%" class="tdbackstyle1">
						<tr>
							<td style="width: 342px; height: 23px;"><strong>Particular
									of Charges (Head of Billing)</strong></td>
							<td style="width: 160px; height: 23px;"><strong>Transaction
									Date</strong></td>
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
							</c:forEach>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="6"><hr class="auto-style1"
						style="width: 100%" /></td>
			</tr>
			<tr>
				<td style="width: 128px">Payment Mode</td>
				<td>${finalBill.paymentMode}
				</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Gross Total</td>
				<td>${finalBill.grossTotal}</td>
			</tr>
			<tr>
				<td style="width: 128px">Balance Received</td>
				<td>${finalBill.balanceReceiveAmount}</td>
				<td>Upto Date Receipt Amount</td>
				<td>${finalBill.finalReceiveAmount}</td>
				<td>Discount&nbsp; =</td>
				<td>${finalBill.discount}</td>
			</tr> 
			<tr>
				<td style="width: 128px">Cheque No</td>
				<td style="">${finalBill.chequeNumber}</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>Tax&nbsp;&nbsp; =</td>
				<td>${finalBill.tax}</td>
			</tr>
			<tr>
				<td style="width: 128px">Cheque Date</td>
				<td style="">${finalBill.chequeDate}</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><strong>Net Amount</strong></td>
				<td style="">${finalBill.netAmount}</td>
			</tr>
			<tr>
				<td style="width: 128px">Bank</td>
				<td>${finalBill.bank}</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 128px">Other Details</td>
				<td>${finalBill.otherDetails}</td>
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
				<td colspan="4" rowspan="3">${finalBill.remark}</td>
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
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
