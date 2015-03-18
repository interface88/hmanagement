<%@page import="com.app.framework.Auth"%>
<%@page import="com.app.framework.DateTimeUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../theme/parts/headerReport.jsp" />

		<table style="width: 82%" cellpadding="3px">
			<tr>
				<td>Staff Name&nbsp;&nbsp;&nbsp; ${ipd.staffName}</td>
				<td style="width: 180px">&nbsp;</td>
				<td>&nbsp;Date Time&nbsp;&nbsp;&nbsp; ${ipd.entryDate}</td>
			</tr>
			<tr>
				<td style="width: 69px">&nbsp;</td>
				<td>&nbsp;</td>
				<td style="width: 180px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Patient Reg No</td>
				<td>Patient Reg Date</td>
				<td>Contact Info</td>
			</tr>
			<tr>
				<td>${ipd.patient.registrationNo}</td>
				<td>${ipd.patient.registrationDate}</td>
				<td>${ipd.patient.contactInfo}</td>
			</tr>
			<tr>
				<td>Patient Name </td>
				<td>Age</td>
				<td>&nbsp</td>
			</tr>
			<tr>
				<td>${ipd.patient.firstName} ${ipd.patient.middleName} ${ipd.patient.lastName}</td>
				<td>${opd.patient.year} year / ${opd.patient.month} month / ${opd.patient.day} day</td>
				<td>&nbsp</td>
			</tr>
			<tr>
				<td>OPD Date</td>
				<td>OPD Doctor</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>${opd.entryDate}</td>
				<td>${opd.doctor.name}></td>
				<td>&nbsp;</td>
			</tr>
				
				<tr>
					<td colspan="3"><hr class="auto-style1" style="width: 100%" /></td>
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
					<td style="width: 69px">${ipd.admissionId}</td>
					<td>${ipd.admissionDate}</td>
					<td style="width: 180px">${ipd.admissionTime}</td>
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
					<td style="width: 69px">${ipd.admissionType.name}
					</td>
					<td>${ipd.doctor.name}
					</td>
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
					<td style="width: 69px">${ipd.ward}
					</td>
					<td>
						${ipd.bedNo}
					</td>
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
					<td colspan=36"><hr class="auto-style1" style="width: 100%" /></td>
				</tr>
			
				<tr>
					<td>Admission Diagnosis</td>
					<td>Admission Details</td>
					<td>Suggested Treatment</td>
				</tr>
				<tr>
					<td>
					${ipd.admissionDiagnosis}</td>
					<td>
					${ipd.admissionDetail}</td>
					<td>
					${ipd.admissionTreatment}</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td>Allergy Details</td>
					<td colspan="2">Special Notes</td>
				</tr>
				<tr>
					<td>
						${ipd.allergyDetail}
					</td>
					<td colspan="4">
						${ipd.specialNote}
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Advance Payment</td>
					<td>${ipd.advancePayment}</td>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 69px">Remarks</td>
					<td colspan="3">
						${ipd.remark}
					</td>
				</tr>
				<tr>
					<td colspan="100%"><hr class="auto-style1" style="width: 100%" /></td>
				</tr>
				<tr>
					<td colspan="100%">
						DECLARATION 								
I _________________(Patient of Relation) being the ____________(relationship with patient) 								
declare that : The details provided in this admission form are true and complete.								
								
Date: 								
Signature of Patient/Relatives ____________________							Operator Name 	
						
					</td>
				</tr>
			</table>
<jsp:include page="../theme/parts/footerReport.jsp" />