<jsp:include page="../theme/parts/headerReport.jsp" />
	<h3 class="clearfix">OPD Report</h3>
	<table style="width: 100%;">
		<tr>
			<td class="strong">Admission Id:</td>
			<td><code>${opd.admissionId}</code></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td class="strong">Staff Name:</td>
			<td><code>${opd.staffName}</code></td>
			<td class="strong">Entry Date Time</td>
			<td><code>${opd.entryDate}</code></td>
		</tr>
		<tr>
			<td class="strong">Case Type:</td>
			<td><code>${opd.caseType}</code></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="strong">Patient Reg No:</td>
			<td><code>${patient.registrationNo}</code> </td>
			<td class="strong">Registration Date:</td>
			<td><code>${patient.registrationDate}</code></td>
		</tr>
		<tr style="border-top: 1px solid #333">
			<td class="strong">Patient Name:</td>
			<td><code>${patient.firstName}&nbsp;${patient.middleName}
				&nbsp;${patient.lastName}</code></td>
			<td></td>
			<td></td>
		</tr>
		<tr align="left">
			<td class="strong">Gender</td>
			<td class="strong">Age (Years/Month/Days)</td>
			<td class="strong">Referred by</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><code>${patient.gender}</code></td>
			<td><code>${patient.year} year/ ${patient.month} month/ ${patient.day}</code> day</td>
			<td><code>${patient.referredBy}</code></td>
			<td></td>
		</tr>

		<tr>
			<td class="strong">Blood Group</td>
			<td class="strong">Weight (Kgs.)</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td><code>${patient.bloodGroup}</code></td>
			<td><code>${patient.weight}</code></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="border-top: 1px solid #333">
			<td class="strong">Address</td>
			<td><code>${patient.address}</code></td>
			<td class="strong">Contact Info</td>
			<td><code>${patient.contactInfo}</code></td>
		</tr>
		<tr>
			<td class="strong">Add1</td>
			<td><code>${patient.address1}</code></td>
			<td class="strong">Tel.No (Home)</td>
			<td><code>${patient.telephone}</code></td>
		</tr>
		<tr>
			<td class="strong">Add2</td>
			<td><code>${patient.address2}</code></td>
			<td class="strong">Mobile No.</td>
			<td><code>${patient.mobile}</code></td>
		</tr>
		<tr>
			<td class="strong">Add3</td>
			<td><code>${patient.address3}</code></td>
			<td>Email</td>
			<td><code>${patient.email}</code></td>
		</tr>
		<tr>
			<td class="strong">Area</td>
			<td><code>${patient.area}</code></td>
			<td class="strong">City</td>
			<td><code>${patient.city}</code></td>
		</tr>
		<tr>
			<td class="strong">District</td>
			<td><code>${patient.district}</code></td>
			<td class="strong">Zip</td>
			<td><code>${patient.zip}</code></td>
		</tr>
		<tr>
			<td class="strong">State</td>
			<td><code>${patient.state}</code></td>
			<td class="strong">Country</td>
			<td><code>${patient.country}</code></td>
		</tr>
		<tr style="border-top: 1px solid #333">
			<td class="strong">IPD Details</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="strong">Doctor Name</td>
			<td><code>${opd.doctor.name}</code></td>
			<td class="strong">Consultation Fee</td>
			<td><code>${opd.consulationFee}</code></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: right">
				<a href="opd"><input type="button" value="Cancel" /></a>
			</td>
		</tr>
	</table>
<jsp:include page="../theme/parts/footerReport.jsp" />