<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<jsp:include page="../theme/parts/headerReport.jsp" />
			<h3 class="clearfix">Payment Collection Report</h3>
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td class="strong">Staff Name</td>
					<td><code>${paymentCollection.staffName}</code></td>
					<td class="strong">Entry Date Time</td>
					<td><code>${paymentCollection.entryDate}</code></td>
				</tr>
				<tr>
					<td class="strong">Admission Id</td>
					<td>
						<code>${paymentCollection.admissionId}</code>
					</td>
					<td class="strong">Payment Date</td>
					<td><code>${paymentCollection.paymentDate}</code></td>
				</tr>
				<tr>
					<td class="strong">Patient Name</td>
					<td colspan="3"><code>${paymentCollection.patient.firstName} ${paymentCollection.patient.lastName}</code></td>
				</tr>
				<tr>
					<td class="strong">Receive Amount</td>
					<td><code>${paymentCollection.receiveAmount}</code></td>
					<td class="strong">Payment Mode</td>
					<td>
						<code>${paymentCollection.paymentMode}</code>
					</td>
				</tr>
				<tr id="chequeDiv">
					<td class="strong">Cheque Number</td>
					<td>
						<code>
							<c:if test="${not empty paymentCollection.chequeNumber}">
								${paymentCollection.chequeNumber}
							</c:if>
							<c:if test="${empty paymentCollection.chequeNumber}">
								N/A
							</c:if>
						</code>
					</td>
					<td><code>${paymentCollection.chequeDate}</code></td>
					<td>
						<code>
							<c:if test="${not empty paymentCollection.chequeDate}">
								${paymentCollection.chequeDate}
							</c:if>
							<c:if test="${empty paymentCollection.chequeDate}">
								N/A
							</c:if>
						</code>
					</td>
				</tr>
				<tr id="bankDiv">
					<td class="strong">Bank</td>
					<td colspan="3"><code>${paymentCollection.bank}</code></td>
				</tr>
				<tr>
					<td class="strong">Other Details</td>
					<td colspan="3"><code>${paymentCollection.otherDetails}</code></td>
				</tr>
				<tr>
					<td class="strong">Remark</td>
					<td colspan="3"><code>${paymentCollection.remark}</code></td>
				</tr>
			</table>
<jsp:include page="../theme/parts/footerReport.jsp" />