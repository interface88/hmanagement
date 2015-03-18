<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.app.framework.Auth"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>HMS-HOME</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="theme/css/main.css" />
		<link rel="stylesheet" type="text/css" href="theme/css/dashbordstyles.css" />
		<link rel="stylesheet"type="text/css" href="theme/menu_files/mbcsmbmcp.css" type="text/css" />
	
		<script type="text/javascript" src="theme/js/jquery-1.9.0.min.js"></script>
		
		<!-- 		js calendar resource loading -->
		<link rel="stylesheet"type="text/css" href="theme/js/JSCal2-1.9/css/jscal2.css" type="text/css" />
		<script type="text/javascript" src="theme/js/JSCal2-1.9/js/jscal2.js"></script>
		<script type="text/javascript" src="theme/js/JSCal2-1.9/js/lang/en.js"></script>
		
		<link rel="stylesheet"type="text/css" href="theme/js/clockpick/jquery.clockpick.1.2.9.css" type="text/css" />
		<script type="text/javascript" src="theme/js/clockpick/jquery.clockpick.1.2.9.js"></script>
		
		
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
					<td align="center">
						<table class="curveshape"  style="height: 135px; border:0px; width:100%; background-color: #ffffff">
							<tr>
								<td  style="vertical-align: top;" >
									<table style="width: 100%">
										<tr>
											<td align="left" width="20%"  ><img src="theme/images/logo1.jpg" height="130px" /></td>
											<td width="*"><img src="theme/images/Banner.png" /></td>
											<td align="right" width="20%"><img src="theme/images/logo2.png" height="130px"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<ul id="mbmcpebul_table" class="mbmcpebul_menulist css_menu" style="width: 100%;background-image:url('theme/menu_files/menuback.png'); height: 40px;">
							<li class="topitem spaced_li first_button"><div class="buttonbg gradient_button gradient40" style="width: 67px;"><a href="home.jsp" >Home</a></div></li>
						  	
						<%
					
						String role=Auth.getRole(request).toString();
					//dashbord function for admin and nursing admin and nusing staff
					if(role.equalsIgnoreCase("Administrator"))
					{
					%>
									  	
						  	<li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40"><div class="arrow"><a class="button_2">Master</a></div></div>
								<ul>
								  
								  	<li><a href="department" title="">Department</a></li>
								  	<li><a href="doctor" title="">Doctor</a></li>
								  	<li><a href="staff" title="">Staff</a></li>
								  	<li><a href="ward" title="">Ward</a></li>
								  	<li><a href="services" title="">Services</a></li>
								  	<li><a href="test" title="">Tests</a></li>
								  	<li><a href="medicine" title="">Medicine</a></li>
								  	<li><a href="admissiontype" title="">Admission Type</a></li>
								  	<li><a href="module" title="">Modules</a></li>
							  	</ul>
						  	</li>
					<% } 
					

					//dashbord function for admin and nursing 1- admin and  nusing staff
					if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Nursing"))
					{
					%>
						  	<li class="topitem spaced_li">
						  		<div class="buttonbg gradient_button gradient40" style="width: 121px;">
						  			<div class="arrow">
						  				<a class="button_3">Registration</a>
						  			</div>
						  		</div>
								<ul>
							  		<li><a href="opd" title="">OPD Registration</a></li>
							  		<li><a href="ipd" title="">IPD Registration</a></li>
							  		<li><a href="patient" title="">Patient List</a></li>
							  	</ul>
							</li>
							<li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 78px;"><a href="nursing" >Nursing</a></div></li>
						
					<% } 
		
				
					//dashbord function for admin and nursing admin and  Cashier
					if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Cashier"))
					{
					%>
						  	<li class="topitem spaced_li">
						  		<div class="buttonbg gradient_button gradient40" style="width: 101px;">
						  			<div class="arrow">
						  				<a class="button_4">Payment</a>
						  			</div>
						  		</div>
						  		<ul>
						  			<li><a href="paymentCollection" title="">Payment Collection</a></li>
						  		</ul>
						  	</li>
					<% } 
					
					//dashbord function for admin and nursing 1- admin and  nusing staff
					if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Nursing"))
					{
					%>
						  	
						   <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 135px;"><a href="dischargeTicket" >Discharge Ticket</a></div></li>
					<% }
					
					//dashbord function for admin and nursing admin and  Cashier
					if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Cashier"))
					{
					%>
						   <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40"><a href="finalBill">Final Bill</a></div></li>
					<% }   	
						  
						  	
					if(role.equalsIgnoreCase("Administrator")||role.equalsIgnoreCase("Nursing"))
					{ %>
						  	<li class="topitem spaced_li">
						  		<div class="buttonbg gradient_button gradient40" style="width: 121px;">
						  			<div class="arrow">
						  				<a class="button_3">Reports</a>
						  			</div>
						  		</div>
								<ul>
							  		<li><a href="report?report=admissionType">AdmissionType</a></li>
							  		<li><a href="report?report=department">Department</a></li>
							  		<li><a href="report?report=doctor">Doctor</a></li>
									<li><a href="report?report=medicine">Medicine</a></li>
									<li><a href="report?report=service">Service</a></li>
									<li><a href="report?report=staff">Staff</a></li>
									<li><a href="report?report=test">Test</a></li>
									<li><a href="report?report=ward">Ward</a></li>
									<li><a href="report?report=module">Module</a></li>
							
									<li><a href="report?report=patient">Patient</a></li>
								
							  	</ul>
						  	</li>
						  	
						<% } %>
						  	<li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 74px;"><a href="logout" >Logout</a></div></li>
						 	<li class="topitem last_button"><div class="buttonbg gradient_button gradient40" style="width: *;"> <a style="font-color:#aa5555;" > Hi..<%= Auth.getLoggedStaffName(request) %>  &nbsp;!</a></div></li>
						</ul>
					</td>
				</tr>
				
				<!-- Middle Part -->
				<tr>
					<td style="background-image: url('theme/images/bg.jpg'); background-repeat: repeat;">
						<table class="intble borderzero">
							<tr>
								<td valign="top" class="leftPanel">
									<table class="boxLeft">
										<tr>
											<td>
												<marquee direction="up" scrollamount="3"><blink style="color: #aa0000">Bulletin Board:- </blink> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>Welcome to Xyz Hospital Management System. </marquee>
		
											</td>
										</tr>
									</table>
								</td>
								<!-- Middle Left Pard -->
								<td align="center" class="boxMiddle">