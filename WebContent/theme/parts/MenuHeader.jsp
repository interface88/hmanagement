
<%@page import="common.commonmethods"%>
<%@page import="common.constants"%>
<link rel="stylesheet" href="theme/menu_files/mbcsmbmcp.css" type="text/css" />
<%

if(!commonmethods.checkSession(session))
{
	response.sendRedirect("index.jsp");
	return;
}
	
%>




<ul id="mbmcpebul_table" class="mbmcpebul_menulist css_menu" style="width: 100%;background-image:url('../parts/menu_files/menuback.png'); height: 40px;">
  <li class="topitem spaced_li first_button"><div class="buttonbg gradient_button gradient40" style="width: 67px;"><a href="Home.jsp" >Home</a></div></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40"><div class="arrow"><a class="button_2">Master</a></div></div>
  <ul>
  <li><a href="department_master" title="">Department</a></li>
  <li><a href="doctor_master" title="">Doctor</a></li>
  <li><a href="staffmaster.jsp" title="">Staff</a></li>
  <li><a href="wardmaster.jsp" title="">Ward</a></li>
  <li><a href="servicesmaster.jsp" title="">Services</a></li>
  <li><a href="testmaster.jsp" title="">Tests</a></li>
  <li><a href="medicinemaster.jsp" title="">Medicine</a></li>
  <li><a href="admissiontypemaster.jsp" title="">Admission Type</a></li>
  <li><a href="modulemaster.jsp" title="">Modules</a></li>
  <li><a href="loginmaster.jsp" title="">Login</a></li>
  </ul></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 121px;"><div class="arrow"><a class="button_3">Registration</a></div></div>
  <ul>
  <li><a href="#" title="">OPD Registration</a></li>
  <li><a href="#" title="">IPD Registration</a></li>
  </ul></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 101px;"><div class="arrow"><a class="button_4">Payment</a></div></div>
  <ul>
  <li><a href="#" title="">Payment Collection</a></li>
  </ul></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 78px;"><a href="#" >Nursing</a></div></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40"><a>Final Bill</a></div></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 135px;"><a href="#" >Discharge Ticket</a></div></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 74px;"><a href="#" >Logout</a></div></li>
  <li class="topitem spaced_li"><div class="buttonbg gradient_button gradient40" style="width: 90px;"><a>&nbsp;</a></div></li>
 <li class="topitem last_button"><div class="buttonbg gradient_button gradient40" style="width: *;"> <a style="font-color:#aa5555;" >  Welcome <%=session.getAttribute("name").toString() %>&nbsp;!</a></div></li>
</ul>

<!-- <table style="width: 100%;" class="divmenu">
<tr><td align="left" width="5%"><a  href="Home.jsp" ><img alt="" border="0px;" title="Home" style="width: 30px;margin-left: 10px;vertical-align: middle;" src="images/dashboard/home.png"></a></td>
<td align="left"><a href="logout"><img alt="" title="Logout" border="0px;" style="width: 28px;margin-left: 10px; text-align: right;vertical-align: middle;" src="images/dashboard/logout.png"> </a></td>
<td align="right" ><div style="margin-right: 20px;">Welcome...&nbsp; <%=session.getAttribute("name").toString() %>&nbsp; !</div></td>
</tr>
</table> -->

