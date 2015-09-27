function CheckForm () {

	//Check for a word to search
	if (document.frmSiteSearch.search.value==""){
		alert("Please enter at least one keyword to search");
		document.frmSiteSearch.search.focus();
		return false;
	}

    return true;
}
