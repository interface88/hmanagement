<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		
		<form name="opd" method="post" action="opd">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="6"><strong>OPD
							Registration</strong></td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Staff Name</td>
					<td style=""><input name="staffName" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Entry Date Time</td>
					<td style=""><input name="entryDate" type="text" /></td>
				</tr>
				<tr>
					<td style="">Case Type</td>
					<td style=""><select name="caseType">
							<option value="-1">-Select-</option>
							<option value="New">New</option>
							<option value="Old">Old</option>
					</select></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
				<tr>
					<td style="">Patient Id</td>
					<td style=""><input name="patientId" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Registration Date</td>
					<td style=""><input name="registrationDate" type="text" /></td>
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
								<td><select name="title">
										<option value="-1">-Select-</option>
										<option value="Mr.">Mr.</option>
										<option value="Ms.">Mrs.</option>
										<option value="Mrs.">Master</option>
										<option value="Dr.">Miss.</option>
								</select></td>
								<td><input name="firstName" type="text" /></td>
								<td><input name="lastName" type="text" /></td>
								<td><input name="middleName" type="text" /></td>
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
					<td style=""><select name="gender">
							<option value="-1">-select</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
					</select></td>
					<td colspan="3" style=""><select name="year"
						style="width: 69px">
							<option>-select-</option>
					</select>&nbsp;<select name="month" style="width: 63px">
							<option>-select-</option>
					</select>&nbsp;<select name="day" style="width: 48px">
							<option>-select-</option>
					</select></td>
					<td style=""><select name="referredBy">
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
					<td style=""><input name="bloodGroup" style="width: 85px"
						type="text" /></td>
					<td style=""><input name="weight" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">&nbsp;</td>
					<td style="">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
				<tr>
					<td style="">Address</td>
					<td colspan="2"><textarea name="address"
							style="width: 189px; height: 42px"></textarea></td>
					<td colspan="2" style="">Contact Info</td>
					<td style="">&nbsp;<input name="contactInfo" type="text" /></td>
				</tr>
				<tr>
					<td style="">Add1</td>
					<td colspan="2" style=""><textarea cols="20" name="adress1"
							rows="1" style="width: 189px; height: 42px"></textarea></td>
					<td colspan="2" style="">Tel.No (Home)</td>
					<td style="">&nbsp;<input name="telephone" type="text" /></td>
				</tr>
				<tr>
					<td style="">Add2</td>
					<td colspan="2"><textarea cols="20" name="adress2" rows="1"
							style="width: 189px; height: 42px"></textarea></td>
					<td colspan="2" style="">Mobile No.</td>
					<td style="">&nbsp;<input name="mobile" type="text" /></td>
				</tr>
				<tr>
					<td style="">Add3</td>
					<td colspan="2"><textarea cols="20" name="adress3" rows="1"
							style="width: 189px; height: 42px"></textarea></td>
					<td colspan="2" style="">Email</td>
					<td style="">&nbsp;<input name="email" type="text" /></td>
				</tr>
				<tr>
					<td style="">Area</td>
					<td style=""><input name="area" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">City</td>
					<td style=""><input name="city" type="text" /></td>
				</tr>
				<tr>
					<td style="">District</td>
					<td style=""><input name="district" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Zip</td>
					<td style=""><input name="zip" type="text" /></td>
				</tr>
				<tr>
					<td style="">State</td>
					<td style=""><input name="state" type="text" /></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Country</td>
					<td style=""><input name="country" type="text" /></td>
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
					<td style=""><select name="doctorId">
							<option>-select-</option>
					</select></td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Consultation Fee</td>
					<td style=""><input name="consulationFee" type="text" /></td>
				</tr>
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="6" align="right"><input name="Submit1"
						type="submit" value="submit" />&nbsp;&nbsp;&nbsp; <input
						name="Reset1" type="reset" value="reset" /></td>
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