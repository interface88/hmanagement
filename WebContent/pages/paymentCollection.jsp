<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		
		<form name="paymentCollectionForm" method="post" action="paymentCollection">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="6"><strong>Payment Collection</strong></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Staff Name</td>
					<td style=""><input name="staff" type="text" value="AAA"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Entry Date Time</td>
					<td style=""><input name="entryDate" type="text" /></td>
				</tr>
				<tr>
					<td style="">Admission Id</td>
					<td style=""><input name="admissionId" type="text"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Payment Date</td>
					<td style=""><input name="paymentDate" type="text" /></td>
				</tr>
				<tr>
					<td style="">Patient Name</td>
					<td colspan="4" style=""><input name="patientId" type="text" /></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Receive Amount</td>
					<td style=""><input name="receiveAmount" type="text"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Payment Mode</td>
					<td style=""><input name="paymentMode" type="text" /></td>
				</tr>
				<tr>
					<td style="">Cheque Number</td>
					<td style=""><input name="chequeNumber" type="text"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Cheque Date</td>
					<td style=""><input name="chequeDate" type="text" /></td>
				</tr>
				<tr>
					<td style="">Bank</td>
					<td colspan="4" style=""><input name="bank" type="text" /></td>
				</tr>
				<tr>
					<td style="">Other Details</td>
					<td colspan="4" style=""><input name="otherDetails" type="text" /></td>
				</tr>
				<tr>
					<td style="">Remark</td>
					<td colspan="4" style=""><input name="remark" type="text" /></td>
				</tr>
				
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">
					<input name="action" type="submit" value="Submit" />&nbsp;&nbsp;&nbsp; 
					<input name="reset" type="reset" value="Reset" /></td>
				</tr>
		
				<tr>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
			</table>
		</form>
<jsp:include page="../theme/parts/footer.jsp" />