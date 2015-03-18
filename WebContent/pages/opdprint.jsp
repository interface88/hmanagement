

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="theme/css/report.css" />
<script type="text/javascript" src="theme/js/jquery-1.3.2.min.js" > </script>
<script type="text/javascript">

    function PrintElem(elem)
    {
	
        Popup($(elem).html());
        
    }
    

    function Popup(data) 
    {
        var mywindow = window.open('', 'my div', 'height=400,width=600');
        mywindow.document.write('<html><head><title>my div</title>');
        /*optional stylesheet*/ //mywindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
        mywindow.document.write('</head><body >');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');

        mywindow.print();
        mywindow.close();

        return true;
    }

</script>


<title>XYZ Hospital Management Report</title>
<link rel="stylesheet" type="text/css" href="theme/css/report.css" />
</head>
<body>
	<div id="mydiv">
		<h1 class="clearfix">XYZ Hospital Management</h1>
		<h3 class="clearfix">IPD Report</h3>
			<table cellpadding="5px" style="width: 100%; height: 100%;">
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td><strong>Admission Id:</strong></td>
					<td><label>${opd.admissionId}</label></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><strong>Staff Name:</strong></td>
					<td><label>${opd.staffName}</label></td>
					<td><strong>Entry Date Time</strong></td>
					<td><label>${opd.entryDate}</label></td>
				</tr>
				<tr>
					<td><strong>Case Type:</strong></td>
					<td><label>${opd.caseType}</label></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td><strong>Patient Reg No:</strong></td>
					<td><label>${patient.registrationNo} </label></td>
					<td><strong>Registration Date:</strong></td>
					<td>${patient.registrationDate}</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>

				<tr>

					<td><strong>Patient Name:</strong></td>
					<td>${patient.firstName}&nbsp;${patient.middleName}
						&nbsp;${patient.lastName}</td>
					<td></td>
					<td></td>
				</tr>
				<tr align="left">
					<td><strong>Gender</strong></strong></td>
					<td><strong>Age (Years/Month/Days)</strong></td>
					<td><strong>Referred by</strong></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label>${patient.gender}</label></td>
					<td>${patient.year} year/${patient.month} month/${patient.day} day</td>
					<td><label>${patient.referredBy}</label></td>
					<td></td>
				</tr>

				<tr>
					<td><strong>Blood Group</strong></td>
					<td><strong>Weight (Kgs.)</strong></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>${patient.bloodGroup}</td>
					<td>${patient.weight}</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td><strong>Address</strong></td>
					<td><label style="width: 250px">${patient.address}</label></td>
					<td><strong>Contact Info</strong></td>
					<td>${patient.contactInfo}</td>
				</tr>
				<tr>
					<td><strong>Add1</strong></td>
					<td><label style="width: 250px">${patient.address1}</label></td>
					<td><strong>Tel.No (Home)</strong></td>
					<td>${patient.telephone}</td>
				</tr>
				<tr>
					<td><strong>Add2</strong></td>
					<td><label style="width: 250px">${patient.address2}</label></td>
					<td><strong>Mobile No.</strong></td>
					<td>${patient.mobile}</td>
				</tr>
				<tr>
					<td><strong>Add3</strong></td>
					<td><label style="width: 250px">${patient.address3}</label></td>
					<td><strong>Email</strong></td>
					<td>${patient.email}</td>
				</tr>
				<tr>
					<td><strong>Area</strong></td>
					<td>${patient.area}</td>
					<td><strong>City</strong></td>
					<td>${patient.city}</td>
				</tr>
				<tr>
					<td><strong>Distric</strong>t</td>
					<td>${patient.district}</td>
					<td><strong>Zip</strong></td>
					<td>${patient.zip}</td>
				</tr>
				<tr>
					<td><strong>State</strong></td>
					<td>${patient.state}</td>
					<td><strong>Country</strong></td>
					<td>${patient.country}</td>
				</tr>
				<tr>
					<td colspan="4"><hr /></td>
				</tr>
				<tr>
					<td><strong>IPD Details</strong></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Doctor Name</td>
					<td><label>${opd.doctor.name}.</label></td>
					<td>Consultation Fee</td>
					<td>${opd.consulationFee}</td>
				</tr>
				<tr>
					<td colspan="100%"><hr /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: right">
				<input type="button" value="Print" onclick="PrintElem('#mydiv')" />&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="opd"><input type="button" value="Cancel" /></a></td>
				</tr>
			</table>
		</div>
</body>
</html>
