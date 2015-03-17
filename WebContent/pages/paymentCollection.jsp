<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		<form name="ipd" method="post" action="paymentCollection" >
			<table style="width: 82%" cellpadding="3px">
				<tr>
					<td  align="center" colspan="3" ><strong>IPD Registration</strong></td>
				</tr>
				<tr>
					<td align="center"><strong>Admission No</strong></td>
					<td>
						<input type="text" name="admissionId" value="" placeholder="OPD Admission no" required/>
						<input type="submit" name="action" value="load" />
					</td>
				</tr>
			</table>
		</form>
		<form name="paymentCollectionForm" method="post" action="paymentCollection">
		<input type="hidden" name="patientId" value="${paymentCollection.patient.id}"/>
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="6"><strong>Payment Collection</strong></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Staff Name</td>
					<td style=""><input name="staffName" type="text" readonly="readonly" value="${paymentCollection.staffName}"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Entry Date Time</td>
					<td style=""><input name="entryDate" type="text" value="<%= DateTimeUtil.getCurrentDate() %>"/></td>
				</tr>
				<tr>
					<td style="">Admission Id</td>
					<td style="">
						<input name="admissionId" readonly="readonly" type="text" value="${paymentCollection.admissionId}"/>
					</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Payment Date</td>
					<td style=""><input name="paymentDate" required="required" type="text" id="paymentDate" /></td>
				</tr>
				<tr>
					<td style="">Patient Name</td>
					<td colspan="6" style=""><input name="patientName" readonly="readonly" type="text" value="${paymentCollection.patient.firstName} ${paymentCollection.patient.lastName}" /></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Receive Amount</td>
					<td style=""><input name="receiveAmount" required="required" type="text" type="number" step="any"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Payment Mode</td>
					<td style="">
						<select name="paymentMode" required="required">
							<option value="Cash">Cash</option>
							<option value="Cheque">Cheque</option>
						</select>
					</td>
				</tr>
				<tr id="chequeDiv">
					<td style="">Cheque Number</td>
					<td style=""><input name="chequeNumber" type="text" maxlength="50"/></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Cheque Date</td>
					<td style=""><input name="chequeDate" id="chequeDate" type="text" /></td>
				</tr>
				<tr id="bankDiv">
					<td style="">Bank</td>
					<td colspan="4" style=""><input name="bank" type="text" maxlength="100" /></td>
				</tr>
				<tr>
					<td style="">Other Details</td>
					<td colspan="4" style=""><input name="otherDetails" type="text" maxlength="100"/></td>
				</tr>
				<tr>
					<td style="">Remark</td>
					<td colspan="4">
						<textarea rows="5" cols="15" name="remark" maxlength="500"></textarea>
					</td>
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
<script>
	function showChequeDiv()
	{
		document.getElementById("chequeDiv");
	}

	Calendar.setup({
        trigger    : "paymentDate",
        inputField : "paymentDate",
        dateFormat: "%d-%m-%Y"
    });

	Calendar.setup({
        trigger    : "chequeDate",
        inputField : "chequeDate",
        dateFormat: "%d-%m-%Y"
    });
</script>