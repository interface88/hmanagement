<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/header.jsp" />
		
		<form name="opd" method="post" action="opd">
			<table cellpadding="5px" style="width: 100%">
				<tr>
					<td align="center" colspan="6">
						<strong>OPD Registration</strong></td>
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
					<td colspan="3" style="">
						<select name="year" style="width: 69px">
							<option value=""></option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option>
						</select>
						&nbsp;
						<select name="month" style="width: 63px">
							<option value=""></option>
							<option value="1">Jan</option>
							<option value="2">Feb</option>
							<option value="3">Mar</option>
							<option value="4">Apr</option>
							<option value="5">May</option>
							<option value="6">Jun</option>
							<option value="7">Jul</option>
							<option value="8">Aug</option>
							<option value="9">Sep</option>
							<option value="10">Oct</option>
							<option value="11">Nov</option>
							<option value="12">Dec</option>
						</select>
						&nbsp;
						<select name="day" style="width: 48px">
							<option value=""></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
					</td>
					<td style="">
						<select name="referredBy">
							<option>-select-</option>
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
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
					<td colspan="2" style=""><textarea cols="20" name="address1"
							rows="1" style="width: 189px; height: 42px"></textarea></td>
					<td colspan="2" style="">Tel.No (Home)</td>
					<td style="">&nbsp;<input name="telephone" type="text" /></td>
				</tr>
				<tr>
					<td style="">Add2</td>
					<td colspan="2"><textarea cols="20" name="address2" rows="1"
							style="width: 189px; height: 42px"></textarea></td>
					<td colspan="2" style="">Mobile No.</td>
					<td style="">&nbsp;<input name="mobile" type="text" /></td>
				</tr>
				<tr>
					<td style="">Add3</td>
					<td colspan="2"><textarea cols="20" name="address3" rows="1"
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
					<td style="">
						<select name="doctorId">
							<c:forEach items="${doctorlist}" var="doctor">
								<option value="${doctor.id}">${doctor.name}</option>
							</c:forEach>
						</select>
					</td>
					<td style="">&nbsp;</td>
					<td colspan="2" style="">Consultation Fee</td>
					<td style=""><input name="consulationFee" type="text" /></td>
				</tr>
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="6" align="right">
						<input name="action" type="submit" value="save" />&nbsp;&nbsp;&nbsp;
						<input name="reset" type="reset" value="reset" /></td>
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