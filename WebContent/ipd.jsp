<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="common.constants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>HMS-IPD Registration</title>
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
							
						<table style="width: 82%" cellpadding="3px">
<tr>
		<td  align="center" colspan="6" ><strong>IPD 
		Registration</strong></td>
	</tr>
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	<tr>
		<td colspan="2">Staff Name&nbsp;&nbsp;&nbsp; <input name="txtsname" type="text" /></td>
		<td style="width: 180px">&nbsp;</td>
		<td colspan="3">&nbsp;Date Time&nbsp;&nbsp;&nbsp; <input name="txtdatetime" type="text" /></td>
	</tr>
	<tr>
		<td style="width: 69px">&nbsp;</td>
		<td>&nbsp;</td>
		<td style="width: 180px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="6">
			<table style="width: 97%; " cellpadding="2px">
				<tr>
					<td style="width: 87px">Patient Id</td>
					<td style="width: 130px">Admission Date</td>
					<td colspan="2">Emergency Contact No</td>
					<td rowspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 87px"><input name="txtpid" type="text" /></td>
					<td style="width: 130px"><input name="txtadmissiontype" type="text" /></td>
					<td colspan="2"><input name="txtemgcontact" type="text" /></td>
				</tr>
				<tr>
					<td style="width: 87px">Patient Name</td>
					<td style="width: 130px">Age</td>
					<td colspan="2">Emergency Contact Name</td>
				</tr>
				<tr>
					<td style="width: 87px"><input name="txtpname" type="text" /></td>
					<td style="width: 130px"><input name="txtage" type="text" /></td>
					<td colspan="2"><input name="txtemgcontactname" type="text" /></td>
				</tr>
				<tr>
					<td style="width: 87px">IPD Date</td>
					<td style="width: 130px">IPD Doctor</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 87px"><input name="txtipddate" type="text" /></td>
					<td style="width: 130px"><input name="txtipddoctor" type="text" /></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>

	<tr>
		<td style="width: 69px">Admission ID</td>
		<td>Admission Date</td>
		<td style="width: 180px">Admission Time</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px"><input name="Text11" type="txtadmissionid" /></td>
		<td><input name="Text12" type="text" /></td>
		<td style="width: 180px"><input name="txtadmissiondate" type="text" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">Admission Type</td>
		<td>Admitting Doctor</td>
		<td style="width: 180px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px"><select name="ddladmissiontype">
		<option>-select-</option>
		</select></td>
		<td><select name="ddladmissingdoctor">
		<option>-select-</option>
		</select></td>
		<td style="width: 180px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">Ward</td>
		<td>Bed No.</td>
		<td style="width: 180px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px"><select name="ddlwardno">
		<option>-select-</option>
		</select></td>
		<td><input name="txtbedno" type="text" /></td>
		<td style="width: 180px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">&nbsp;</td>
		<td>&nbsp;</td>
		<td style="width: 180px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>

	<tr>
		<td colspan="2">Admission Diagnosis</td>
		<td colspan="2">Admission Details</td>
		<td colspan="2">Suggested Treatment</td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea name="txtdiagnosis" rows="1" style="width: 259px; height: 121px"></textarea></td>
		<td colspan="2">
		<textarea name="txtadmissiondetail" rows="1" style="width: 203px; height: 121px"></textarea></td>
		<td colspan="2">
		<textarea name="txtsugtreatment" rows="1" style="width: 211px; height: 121px"></textarea></td>
	</tr>
	<tr>
		<td colspan="6">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">Allergy Details</td>
		<td colspan="4">Special Notes</td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea cols="20" name="txtallergy" rows="1" style="width: 261px; height: 121px"></textarea></td>
		<td colspan="4">
		<textarea name="txtspecialnotes" rows="1" style="width: 437px; height: 121px"></textarea></td>
	</tr>
	<tr>
		<td colspan="6">&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">Advance Payment</td>
		<td><input name="txtadvancepayment" type="text" /></td>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">Remarks</td>
		<td colspan="5" rowspan="4">
		<textarea name="txtremarks" rows="1" style="width: 389px; height: 121px"></textarea></td>
	</tr>
	<tr>
		<td style="width: 69px">&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">&nbsp;</td>
	</tr>
	<tr>
		<td style="width: 69px">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="100%"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	
	<tr>
		<td colspan="6" align="right">
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