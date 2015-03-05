function generateCompareTRs(iCol) {
	return function compareTRs(oTR1, oTR2) {
		var sValue1 = oTR1.cells[iCol].firstChild.nodeValue;
		var sValue2 = oTR2.cells[iCol].firstChild.nodeValue;
		return sValue1.localeCompare(sValue2);
	};
}
function sortTable(sTableID, iCol) {

	
	var oTable = document.getElementById(sTableID);
	var oTBody = oTable.tBodies[0];
	var colDataRows = oTBody.rows;
	var aTRs = new Array;
	for (var i=0; i < colDataRows.length; i++) {
		aTRs[i] = colDataRows[i];
	}
	aTRs.sort(generateCompareTRs(iCol));
	var oFragment = document.createDocumentFragment();
	for (var i=0; i < aTRs.length; i++) {
		oFragment.appendChild(aTRs[i]);
	}
	oTBody.appendChild(oFragment);
}