<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-OPD Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>

<body>

	<div>
		<table class="maintble">
			<!-- Header Part -->
			<tr>
				<td align="center"><jsp:include page="common/Header.jsp" /></td>
			</tr>
			<tr>
				<td align="center"><jsp:include page="common/MenuHeader.jsp" /></td>
			</tr>
			<!-- Middle Part -->
			<tr>
				<td
					style="background-image: url('images/bg.jpg'); background-repeat: repeat;">
					<table class="intble ">
						<tr>
							<td valign="top" class="leftPanel"><jsp:include
									page="leftpanel/homeleft.jsp" /></td>
							<!-- Middle Left Pard -->


							<td align="center" class="boxMiddle">

								<form name="ipd" method="post" action="">
								<table cellpadding="5px" style="width:100%">
	<tr>
		<td align="center" colspan="6" ><strong>OPD 
		Registration</strong></td>
	</tr>
	<tr>
		<td colspan="6"><hr /></td>
	</tr>
	<tr>
		<td style="">Staff Name</td>
		<td style=""><input name="txtsname" type="text" /></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">Entry Date Time</td>
		<td style=""><input name="txtentrydate" type="text" /></td>
	</tr>
	<tr>
		<td style="">Case Type</td>
		<td style="">
			<select name="ddlcasetype">
				<option value="-1">-Select-</option>
				<option value="New">New</option>
				<option value="Old">Old</option>
			</select>	
		</td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">&nbsp;</td>
		<td style="">&nbsp;</td>
	</tr>
	<tr>
		<td style="">Patient Id</td>
		<td style=""><input name="txtpid" type="text" /></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">Registration Date</td>
		<td style=""><input name="txtregdate" type="text" /></td>
	</tr>
	<tr>
		<td colspan="6"><hr /></td>
	</tr>
	<tr align="left">
		<td colspan="6">
		<table style="width: 77%">
			<tr>
				<td>Title</td>
				<td>First Name</td>
				<td>Surname</td>
				<td>Middle Name</td>
			</tr>
			<tr>
				<td><select name="ddltitle">
				<option value="-1">-Select-</option>
				<option value="Mr.">Mr.</option>
				<option value="Ms.">Mrs.</option>
				<option value="Mrs.">Master</option>
				<option value="Dr.">Miss.</option>
				</select></td>
				<td><input name="txtfname" type="text" /></td>
				<td><input name="txtsname" type="text" /></td>
				<td><input name="txtmname" type="text" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr align="left">
		<td style="">Gender</td>
		<td colspan="2" style="">Age (Years/Month/Days)</td>
		<td colspan="2" style="">Referred by</td>
		<td style="">&nbsp;</td>
	</tr>
	<tr>
		<td style=""><select name="ddlgender">
		<option value="-1">-select</option>
		<option value="Male">Male</option>
		<option value="Female">Female</option>
		<option value="Other">Other</option>
		</select></td>
		<td colspan="3" style="">
		<select name="ddlyear" style="width: 69px">
			<option>-select-</option>
		</select>&nbsp;<select name="ddlmonth" style="width: 63px">
			<option>-select-</option>
		</select>&nbsp;<select name="ddldays" style="width: 48px">
			<option>-select-</option>
		</select></td>
		<td style=""><select name="ddlreferredby">
			<option>-select-</option>
		</select></td>
		<td style=""></td>
	</tr>
	
	<tr>
		<td style="">Blood Group</td>
		<td style="">Weight (Kgs.)</td>
		<td style="">&nbsp;</td>
		<td colspan="2" style=""></td>
		<td style=""></td>
	</tr>
	
	<tr>
		<td style="">
		<input name="txtbloodgroup" style="width: 85px" type="text" /></td>
		<td style=""><input name="txtweight" type="text" /></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">&nbsp;</td>
		<td style="">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="6"><hr /></td>
	</tr>
	<tr>
		<td style="">Address</td>
		<td colspan="2">
		<textarea name="txtaddress" style="width: 189px; height: 42px"></textarea></td>
		<td colspan="2" style="">Contact Info</td>
		<td style="">&nbsp;<input name="txtcontactinfo" type="text" /></td>
	</tr>
	<tr>
		<td style="">Add1</td>
		<td colspan="2" style="">
		<textarea cols="20" name="txtadd1" rows="1" style="width: 189px; height: 42px"></textarea></td>
		<td colspan="2" style="">Tel.No (Home)</td>
		<td style="">&nbsp;<input name="txttle" type="text" /></td>
	</tr>
	<tr>
		<td style="">Add2</td>
		<td colspan="2">
		<textarea cols="20" name="txtadd2" rows="1" style="width: 189px; height: 42px"></textarea></td>
		<td colspan="2" style="">Mobile No.</td>
		<td style="">&nbsp;<input name="txtmobile" type="text" /></td>
	</tr>
	<tr>
		<td style="">Add3</td>
		<td colspan="2">
		<textarea cols="20" name="txtadd3" rows="1" style="width: 189px; height: 42px"></textarea></td>
		<td colspan="2" style="">Email</td>
		<td style="">&nbsp;<input name="txtemail" type="text" /></td>
	</tr>
	<tr>
		<td style="">Area</td>
		<td style=""><input name="txtarea" type="text" /></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">City</td>
		<td style=""><input name="txtcity" type="text" /></td>
	</tr>
	<tr>
		<td style="">District</td>
		<td style=""><input name="txtdistrict" type="text" /></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">Zip</td>
		<td style=""><input name="txtzip" type="text" /></td>
	</tr>
	<tr>
		<td style="">State</td>
		<td style=""><input name="txtstate" type="text" /></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">Country</td>
		<td style=""><input name="txtcountry" type="text" /></td>
	</tr>
	<tr>
		<td colspan="6"><hr /></td>
	</tr>
	<tr>
		<td style=""><strong>IPD Details</strong></td>
		<td style="">&nbsp;</td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">&nbsp;</td>
		<td style="">&nbsp;</td>
	</tr>
	<tr>
		<td style="">Doctor Name</td>
		<td style=""><select name="ddldoctor">
			<option>-select-</option>
		</select></td>
		<td style="">&nbsp;</td>
		<td colspan="2" style="">
		Consultation Fee</td>
		<td style=""><input name="txtfee" type="text" /></td>
	</tr>
	<tr>
		<td colspan="100%"><hr /></td>
	</tr>
		<tr>
		<td colspan="6" align="right">
		<input name="Submit1" type="submit" value="submit" />&nbsp;&nbsp;&nbsp;
		<input name="Reset1" type="reset" value="reset" /></td>
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
							</td>

						</tr>
					</table>
				</td>
			</tr>
			<!-- Footer Part -->
			<tr>
				<td><jsp:include page="common/Footer.jsp" /></td>
			</tr>
		</table>
	</div>
</body>
</html>