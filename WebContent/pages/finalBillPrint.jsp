<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />
		<h3 class="clearfix">Final Bill Report</h3>
		<table class="tdright">
			<tr>
				<td align="center" colspan="6"><strong>Final
						Bill</strong></td>
			</tr>
			<tr>
				<td class="strong">Staff Name</td>
				<td><code>${finalBill.staffName}</code></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="strong">Entry Date</td>
				<td><code>${finalBill.entryDate}</code></td>
			</tr>
			<tr>
				<td class="strong" colspan="2">Name</td>
				<td class="strong">Adm. Type</td>
				<td class="strong">Adm. Date</td>
				<td class="strong">Dis. Date</td>
				<td class="strong">Adm. Doctor</td>
			</tr>
			<tr>
				<td colspan="2"><code>${finalBill.patient.firstName} ${finalBill.patient.middleName} ${finalBill.patient.lastName}</code></td>
				<td><code>${finalBill.admissionType.name}</code></td>
				<td><code>${finalBill.ipd.admissionDate}</code></td>
				<td><code>${finalBill.dischargeDate}</code></td>
				<td><code>${finalBill.doctor.name}</code></td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td class="strong">Bill No.</td>
				<td><code>${finalBill.billNo}</code></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="strong">Bill Date</td>
				<td><code>${finalBill.billDate}</code></td>
			</tr>
			<tr>
				<td colspan="6">
					<table style="width: 100%" class="tdbackstyle1">
						<tr>
							<td style="width: 342px; height: 23px;">
								<strong>Particular of Charges (Head of Billing)</strong></td>
							<td style="width: 160px; height: 23px;">
								<strong>Transaction Date</strong></td>
							<td style="width: 89px; height: 23px;"><strong>Rate</strong></td>
							<td style="width: 89px; height: 23px;"><strong>Qty./Days</strong></td>
							<td style="height: 23px"><strong>Amount</strong></td>
						</tr>
						<c:forEach items="${nursingList}" var="nursing">
							<c:forEach items="${nursing.nursingTransactions}" var="transaction">
							<tr>
								<td style="width: 342px"><code>${transaction.treatment}</code></td>
								<td style="width: 160px"><code>${nursing.nursingDate}</code></td>
								<td style="width: 89px">&nbsp;</td>
								<td style="width: 89px">&nbsp;</td>
								<td style="width: 89px"><code>${transaction.treatmentCost}</code></td>
							</tr>
							</c:forEach>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr style="border-top: 1px solid #333">
				<td class="strong">Payment Mode</td>
				<td><code>${finalBill.paymentMode}</code>
				</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="strong">Gross Total</td>
				<td><code>${finalBill.grossTotal}</code></td>
			</tr>
			<tr>
				<td class="strong">Balance Received</td>
				<td><code>${finalBill.balanceReceiveAmount}</code></td>
				<td class="strong">Upto Date Receipt Amount</td>
				<td><code>${finalBill.finalReceiveAmount}</code></td>
				<td class="strong">Discount</td>
				<td><code>${finalBill.discount}</code></td>
			</tr> 
			<tr>
				<td class="strong">Cheque No</td>
				<td style=""><code>${finalBill.chequeNumber}</code></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td class="strong">Tax</td>
				<td><code>${finalBill.tax}</code></td>
			</tr>
			<tr>
				<td class="strong">Cheque Date</td>
				<td style=""><code>${finalBill.chequeDate}</code></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><strong>Net Amount</strong></td>
				<td style=""><code>${finalBill.netAmount}</code></td>
			</tr>
			<tr>
				<td class="strong">Bank</td>
				<td><code>${finalBill.bank}</code></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="strong">Other Details</td>
				<td><code>${finalBill.otherDetails}</code></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="strong">Remark</td>
				<td colspan="4" rowspan="3"><code>${finalBill.remark}</code></td>
				<td>&nbsp;</td>
			</tr>
		</table>
<jsp:include page="../theme/parts/footerReport.jsp" />
