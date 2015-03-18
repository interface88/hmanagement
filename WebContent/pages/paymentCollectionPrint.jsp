<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<jsp:include page="../theme/parts/headerReport.jsp" />
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="6"><strong>Payment Collection</strong></td>
				</tr>
				<tr>
					<td style="">Staff Name</td>
					<td style="">${paymentCollection.staffName}</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Entry Date Time</td>
					<td style="">${paymentCollection.entryDate}</td>
				</tr>
				<tr>
					<td style="">Admission Id</td>
					<td style="">
						${paymentCollection.admissionId}
					</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Payment Date</td>
					<td style="">${paymentCollection.paymentDate}</td>
				</tr>
				<tr>
					<td style="">Patient Name</td>
					<td colspan="6" style="">${paymentCollection.patient.firstName} ${paymentCollection.patient.lastName}</td>
				</tr>
				<tr>
					<td style="">Receive Amount</td>
					<td style="">${paymentCollection.receiveAmount}</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Payment Mode</td>
					<td style="">${paymentCollection.paymentMode}
					</td>
				</tr>
				<tr id="chequeDiv">
					<td style="">Cheque Number</td>
					<td style="">${paymentCollection.chequeNumber}</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Cheque Date</td>
					<td style="">${paymentCollection.chequeDate}</td>
				</tr>
				<tr id="bankDiv">
					<td style="">Bank</td>
					<td colspan="4" style="">${paymentCollection.bank}</td>
				</tr>
				<tr>
					<td style="">Other Details</td>
					<td colspan="4" style="">${paymentCollection.otherDetails}</td>
				</tr>
				<tr>
					<td style="">Remark</td>
					<td colspan="4" style="">${paymentCollection.remark}</td>
				</tr>
				
				<tr>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
			</table>
<jsp:include page="../theme/parts/footerReport.jsp" />