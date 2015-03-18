<%@page import="com.app.framework.Auth"%>
<jsp:include page="theme/parts/header.jsp" />
		<div>
		
		<%
		String role=Auth.getRole(request).toString();
		System.out.println("Role "+role);
	
							
		//dashbord function for admin and nursing 1- admin and 4- nusing staff
		if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Nursing"))
		{
		%>
		 	
			<a class="dashboard-module" href="opd?action=addNew"> <img
				width="64" height="64" alt="OPD Registration"
				src="theme/images/dashboard/registration.png" /> <span>OPD Registration</span>
			</a>
			
			<a class="dashboard-module" href="ipd"> <img
				width="64" height="64" alt="IPD Registration"
				src="theme/images/dashboard/indoorregistration.png" /> 
				<span>IPD Registration</span>
			</a> 
			<a class="dashboard-module" href="nursing"> <img
				width="64" height="64" alt="Payment Collection"
				src="theme/images/dashboard/nursing.png" /> <span>Nursing Module</span>
			</a>
	 <%	} 
		
		if(role.equalsIgnoreCase("Administrator"))
		{ %>
			
			<a class="dashboard-module" href="staff"> <img
				width="64" height="64" alt="Add Staff"
				src="theme/images/dashboard/adduser.png" /> <span>Add Staff</span>
			</a>
		
		<%
		}
		//dashbord function for admin and cashier 1- admin and 3- cashier 
		if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Cashier"))
		{ %>
			
			 <a class="dashboard-module" href="paymentCollection"> <img
				width="64" height="64" alt="Payment Collection"
				src="theme/images/dashboard/payment.png" /> <span>Payment Collection</span>
			</a>			 
			
			 <a class="dashboard-module" href="finalBill"> <img
				width="64" height="64" alt="Final Billing"
				src="theme/images/dashboard/finalbilling.png"/> <span>Final Billing</span>
			</a>
		<% } 
		
		//dashbord function for admin and nursing 1- admin and 4- nusing staff
		if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Nursing"))
		{
		%>
			 <a class="dashboard-module" href="#"> <img
				width="64" height="64" alt="Discharge Ticket"
				src="theme/images/dashboard/dischargeticket.png" /> <span>Discharge Ticket</span>
			</a>  <a class="dashboard-module" href=""> <img width="64"
				height="64" alt="edit" src="theme/images/dashboard/help.png" /> <span>Help</span>
			</a>
		<% } %>
			<div style="clear: both"></div>
		</div>
	<jsp:include page="theme/parts/footer.jsp" />							
							