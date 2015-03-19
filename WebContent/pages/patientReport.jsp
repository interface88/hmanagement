<%@page import="com.app.framework.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
	<div style="text-align: left;">
		<form name="patientReport" method="post" action="patientReport">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td colspan="2">
						<h4 style="color:red">${msg}</h4>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<strong>Get Detail with Registration No </strong>
					</td>
				</tr>
				<tr>
					<td style="">Patient Registration No</td>
					<td style="">
						<input id="registrationNo" name="registrationNo" type="text" value="${admissionNo}" />
						
					</td>
					<td style=""><input type="submit" value="Get Detail"></td>
				</tr>
			</table>
		</form>
		<hr>
		<h3 class="clearfix"> Opds List</h3>
		<table class="pure-table">
			<thead>
				<tr>
				
					<th>Admission No</th>
					<th>Staff Name</th>
					<th>Entry Date</th>
					<th>CaseType</th>
					<th>Consultation Fee</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${opdlist}" var="opd">
					<tr>
						<td>${opd.admissionId}</td>
						<td>${opd.staffName}</td>
						<td>${opd.entryDate}</td>
						<td>${opd.caseType}</td>
						<td>${opd.consulationFee}</td>
						<th><a href="patientReport?report=opd&id=${opd.id}">View Report</a></th>
						<th><a href="patientReport?report=prescription&id=${opd.id}">Print prescription</a></th>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
		<hr>
		<h3 class="clearfix"> Ipds List</h3>
		<table  class="pure-table">
			<thead>
				<tr>
				
					<th>Admission No</th>
					<th>Staff Name</th>
					<th>Admission Date</th>
					<th>Entry Date</th>
					<th>Admission Time</th>
					<th></th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${ipdlist}" var="ipd">
					<tr>
						<td>${ipd.admissionId}</td>
						<td>${ipd.staffName}</td>
						<td>${ipd.admissionDate}</td>
						<td>${ipd.entryDate}</td>
						<td>${ipd.admissionTime}</td>
						<th><a href="patientReport?report=ipd&id=${ipd.id}">View Report</a></th>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
		<hr>
		<h3 class="clearfix"> Discharge Ticket List</h3>
		<table  class="pure-table">
			<thead>
				<tr>
					<th>Admission No</th>
					<th>Entry Date</th>
					<th>Doctor name</th>
					<th>Treatment Note</th>
					<th></th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${dischargeTicketlist}" var="dischargeTicket">
					<tr>
						<td>${dischargeTicket.admissionId}</td>
						<td>${dischargeTicket.entryDate}</td>
						<td>${dischargeTicket.doctor}</td>
						<td>${dischargeTicket.treatmentNote}</td>
						<th><a href="patientReport?report=dischargeTicket&id=${dischargeTicket.id}">View Report</a></th>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
		<h3 class="clearfix"> Payment Collection</h3>
		<table  class="pure-table">
			<thead>
				<tr>
					<th>Admission No</th>
					<th>Payment Date</th>
					<th>Payment Mode</th>
					<th>Received Ammount</th>
					<th></th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${paymentCollectionlist}" var="paymentCollection">
					<tr>
						<td>${paymentCollection.admissionId}</td>
						<td>${paymentCollection.paymentDate}</td>
						<td>${paymentCollection.paymentMode}</td>
						<td>${paymentCollection.receiveAmount}</td>
						<th><a href="patientReport?report=paymentCollection&id=${paymentCollection.id}">View Report</a></th>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
		<h3 class="clearfix"> Final Bill</h3>
		<table  class="pure-table" style="margin-bottom:30px;">
			<thead>
				<tr>
					<th>Admission No</th>
					<th>Bill No</th>
					<th>Bill Date</th>
					<th>Net Amount</th>
					<th></th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${finalBilllist}" var="finalBill">
					<tr>
						<td>${finalBill.admissionId}</td>
						<td>${finalBill.billNo}</td>
						<td>${finalBill.billDate}</td>
						<td>${finalBill.netAmount}</td>
						<th><a href="patientReport?report=finalBill&id=${finalBill.id}">View Report</a></th>
					</tr>
				</c:forEach>
			</tbody>			
		</table>
	</div>
		
<jsp:include page="../theme/parts/footer.jsp" />