<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-Dep Master</title>
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
					
					<table cellpadding="4px" style="width: 100%">
	<tr>
		<td align="center" colspan="4"><strong>Payment Collection</strong></td>
	</tr>
	<tr>
		<td colspan="4"><hr /></td>
	</tr>
	<tr>
		<td style="width: 144px">Staff Name</td>
		<td style="width: 180px"><input name="txtsname" type="text" /></td>
		<td style="width: 127px">Entry Date/Time</td>
		<td><input name="txtentrydate" type="text" /></td>
	</tr>
	<tr>
		<td style="width: 144px">Patient Id</td>
		<td style="width: 180px"><input name="txtpid" type="text" /></td>
		<td style="width: 127px">Date</td>
		<td><input name="txtdate" type="text" /></td>
	</tr>
	<tr>
		<td style="width: 144px">Patient Name</td>
		<td style="width: 180px"><input name="txtpname" type="text" /></td>
		<td style="width: 127px">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 144px">Receive Amount</td>
		<td style="width: 180px"><input name="txtreceivedamt" type="text" /></td>
		<td style="width: 127px">Payment Mode</td>
		<td><select name="ddlpaymode">
		<option value="Cash">Cash</option>
		<option valud="Check">Check</option>
		<option value="D.D.">D.D.</option>
		<option value="Payment Card">Payment Card</option>
		</select></td>
	</tr>
	<tr>
		<td style="width: 144px">Cheque No.</td>
		<td style="width: 180px"><input name="txtchqno" type="text" /></td>
		<td style="width: 127px">Cheque Date</td>
		<td><input name="txtchqdate" type="text" /></td>
	</tr>
	<tr>
		<td style="width: 144px">Bank</td>
		<td style="width: 180px"><input name="txtbank" type="text" /></td>
		<td style="width: 127px">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 144px">Payment Other Detail</td>
		<td colspan="2">
		<textarea name="txtotherdetail" style="width: 268px; height: 48px"></textarea></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 144px">Remarks</td>
		<td colspan="2">
		<textarea cols="20" name="txtremarks" rows="1" style="width: 268px; height: 48px"></textarea></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="100%"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	
	<tr>
		<td colspan="100%" align="right">
		<input name="Submit1" type="submit" value="submit" />&nbsp;&nbsp;&nbsp;
		<input name="Reset1" type="reset" value="reset" /></td>
	</tr>
	<tr>
		<td colspan="100%">&nbsp;</td>
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