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
								<table style="width: 93%" cellpadding="3px;">
    <tr>
		<td align="center" colspan="6"><strong>Nursing Module</strong></td>
	</tr>
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>

	<tr>
		<td>Staff Name</td>
		<td style="width: 130px"><input name="Text1" type="text" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>Entry Date Time</td>
		<td><input name="Text2" type="text" style="width: 120px" /></td>
	</tr>
	<tr>
		<td style="height: 23px">Patient Id</td>
		<td style="width: 130px; height: 23px">Patient name</td>
		<td style="height: 23px">Date</td>
		<td style="height: 23px">Time</td>
		<td style="height: 23px">Doctor</td>
		<td style="height: 23px">no. of visit</td>
	</tr>
	<tr>
		<td><input name="Text3" style="width: 110px" type="text" /></td>
		<td style="width: 130px"><input name="Text4" type="text" /></td>
		<td><input name="Text5" type="text" /></td>
		<td><input name="Text6" type="text" /></td>
		<td><select class="ddlmidium" name="Select4">
		<option></option>
		</select></td>
		<td><input name="Text7" type="text" style="width: 120px" /></td>
	</tr>
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	<tr >
		<td><strong>Examing</strong></td>
		<td style="width: 130px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="tdbackstyle1">
		<td>Pressure (mmHg)</td>
		<td style="width: 130px">Pulse(BMP)</td>
		<td>Temp(~F)</td>
		<td>Suger</td>
		<td>Time</td>
		<td>Remark</td>
	</tr>
	<tr>
		<td><input name="Text8" type="text" style="width: 110px" /></td>
		<td style="width: 130px"><input name="Text9" type="text" /></td>
		<td><input name="Text10" type="text" /></td>
		<td><input name="Text11" type="text" /></td>
		<td><input name="Text12" type="text" /></td>
		<td>
				<textarea name="TextArea2" style="width: 95%; height: 35px" cols="20" rows="1"></textarea></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="width: 130px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td style="width: 130px">&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	<tr>
		<td style="height: 30px"><strong>Medicine</strong></td>
		<td style="width: 130px; height: 30px;"></td>
		<td style="height: 30px"></td>
		<td style="height: 30px"></td>
		<td style="height: 30px"></td>
		<td style="height: 30px"></td>
	</tr>
	<tr>
		<td colspan="6">
		<table style="width: 100%" class="tdbackstyle1">
			<tr class="tdbackstyle1">
				<td style="width: 62px; height: 31px"><strong>S.No</strong></td>
				<td style="width: 182px; height: 31px"><strong>Name</strong></td>
				<td style="width: 131px; height: 31px"><strong>Dosage</strong></td>
				<td style="width: 123px; height: 31px"><strong>Time</strong></td>
				<td style="height: 31px; width: 300px"><strong>Remarks</strong></td>
				<td style="height: 31px">&nbsp;</td>
			</tr>
			<tr valign="top">
				<td style="height: 29px; width: 62px"></td>
				<td style="height: 29px; width: 182px"><select class="ddlbig" name="Select1">
		<option></option>
		</select></td>
				<td style="height: 29px; width: 131px"><input name="Text15" type="text" /></td>
				<td style="height: 29px; width: 123px"><input name="Text16" type="text" /></td>
				<td style="height: 29px; width: 300px">
				<textarea name="TextArea1" style="width: 95%; height: 35px"></textarea></td>
					<td style="height: 29px" align="center" valign="middle">
				<input name="Submit3" type="submit" value="Add" /></td>
			</tr>
			<tr>
				<td style="width: 62px">&nbsp;</td>
				<td style="width: 182px">&nbsp;</td>
				<td style="width: 131px">&nbsp;</td>
				<td style="width: 123px">&nbsp;</td>
				<td style="width: 266px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 62px">&nbsp;</td>
				<td style="width: 182px">&nbsp;</td>
				<td style="width: 131px">&nbsp;</td>
				<td style="width: 123px">&nbsp;</td>
				<td style="width: 266px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 62px">&nbsp;</td>
				<td style="width: 182px">&nbsp;</td>
				<td style="width: 131px">&nbsp;</td>
				<td style="width: 123px">&nbsp;</td>
				<td style="width: 266px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		
		</td>
	</tr>
	<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	<tr>
		<td style="height: 30px"><strong>Test</strong></td>
		<td style="width: 130px; height: 30px;"></td>
		<td style="height: 30px"></td>
		<td style="height: 30px"></td>
		<td style="height: 30px"></td>
		<td style="height: 30px"></td>
	</tr>
	<tr>
		<td colspan="6">
		<table style="width: 100%" class="tdbackstyle1">
			<tr>
				<td style="width: 62px; height: 31px"><strong>S.No</strong></td>
				<td style="width: 182px; height: 31px"><strong>Type</strong></td>
				<td style="width: 131px; height: 31px"><strong>Name</strong></td>
				<td style="width: 123px; height: 31px"><strong>Time</strong></td>
				<td style="height: 31px; width: 300px"><strong>Remarks</strong></td>
				<td style="height: 31px">&nbsp;</td>
			</tr>
			<tr valign="top">
				<td style="height: 39px; width: 62px"></td>
				<td style="height: 39px; width: 182px"><select class="ddlmidium" name="Select5">
		<option></option>
		</select></td>
				<td style="height: 39px; width: 131px"><select class="ddlbig" name="Select6">
		<option></option>
		</select></td>
				<td style="height: 39px; width: 123px">
				<input name="Text18" type="text" /></td>
				<td style="height: 39px; width: 266px">
				<textarea name="TextArea1" style="width: 95%; height: 35px"></textarea></td>
				<td style="height: 29px" align="center" valign="middle">
				<input name="Submit2" type="submit" value="Add" /></td>
			</tr>
			<tr>
				<td style="width: 62px">&nbsp;</td>
				<td style="width: 182px">&nbsp;</td>
				<td style="width: 131px">&nbsp;</td>
				<td style="width: 123px">&nbsp;</td>
				<td style="width: 266px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 62px">&nbsp;</td>
				<td style="width: 182px">&nbsp;</td>
				<td style="width: 131px">&nbsp;</td>
				<td style="width: 123px">&nbsp;</td>
				<td style="width: 266px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 62px">&nbsp;</td>
				<td style="width: 182px">&nbsp;</td>
				<td style="width: 131px">&nbsp;</td>
				<td style="width: 123px">&nbsp;</td>
				<td style="width: 266px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		
		</td>
	</tr>
		<tr>
		<td colspan="6"><hr class="auto-style1" style="width: 100%" /></td>
	</tr>
	
	<tr>
		<td colspan="6" align="right">
		<input name="Submit1" type="submit" value="submit" />&nbsp;&nbsp;&nbsp;
		<input name="Reset1" type="reset" value="reset" /></td>
	</tr>
	<tr>
		<td colspan="6">&nbsp;</td>
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