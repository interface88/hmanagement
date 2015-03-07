"WebContent/Home.jsp"
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.commonmethods"%>
<%@page import="common.constants"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-HOME</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/dashbordstyles.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<style>
.borderzero td img {
	border: 0px;
}
</style>
</head>

<body>

	<div>
		<table class="maintble">
			<!-- Header Part -->
			<tr>
				<td align="center"><jsp:include page="/parts/header.jsp" /></td>
			</tr>
			<tr>
				<td align="center"><jsp:include page="/parts/menu.jsp" /></td>
			</tr>
			<!-- Middle Part -->
			<tr>
				<td
					style="background-image: url('..//images/bg.jpg'); background-repeat: repeat;">
					<table class="intble borderzero">
						<tr>
							<td valign="top" class="leftPanel">
							<jsp:include page="..//parts/leftPanel.jsp" /></td>
							<!-- Middle Left Pard -->

							<td align="center" class="boxMiddle">
								<%						
								if(!commonmethods.checkSession(session))
								{
									response.sendRedirect("index.jsp");
									return;
								}


		//	String role=session.getAttribute("role").toString();
			//					System.out.println("Role "+role);
			
			//dashboard for superadmin
			//if(role.equalsIgnoreCase(constants.role.values()[2].toString())){
			%>
								<div>

								 	<a class="dashboard-module" href="newhostingrequest"> <img
										width="64" height="64" alt="Add Staff"
										src="..//images/dashboard/adduser.png" /> <span>Add Staff</span>
									</a>
									<a class="dashboard-module" href="newhostingapproval"> <img
										width="64" height="64" alt="OPD Registration"
										src="..//images/dashboard/registration.png" /> <span>OPD Registration</span>
									</a>
									
									<a class="dashboard-module" href="addnew.jsp"> <img
										width="64" height="64" alt="IPD Registration"
										src="..//images/dashboard/indoorregistration.png" /> 
										<span>IPD Registration</span>
									</a> 
									
									 <a class="dashboard-module" href="uploadsafetohost"> <img
										width="64" height="64" alt="Payment Collection"
										src="..//images/dashboard/payment.png" /> <span>Payment Collection</span>
									</a>
									 <a class="dashboard-module" href="expirydetails"> <img
										width="64" height="64" alt="Final Billing"
										src="..//images/dashboard/finalbilling.png"/> <span>Final Billing</span>
									</a>
									 <a class="dashboard-module" href="showlist"> <img
										width="64" height="64" alt="Discharge Ticket"
										src="..//images/dashboard/dischargeticket.png" /> <span>Discharge Ticket</span>
									</a>  <a class="dashboard-module" href=""> <img width="64"
										height="64" alt="edit" src="..//images/dashboard/help.png" /> <span>Help</span>
									</a>

									<div style="clear: both"></div>
								</div> <% //} %> 
								
								
								
							</td>

						</tr>
					</table>

				</td>
			</tr>
			<!-- Footer Part -->
			<tr>
				<td><jsp:include page="/parts/footer.jsp" /></td>
			</tr>
		</table>
	</div>
</body>
</html>