window.onload = hideToten;

function hideToten() {
	if(!getElement('float_toten')) return false;
	getElement('float_toten').style.display = "none";
}
function createAjax() {
	var ajax;
	try{
		ajax = new XMLHttpRequest();
	} catch(ee) {
		try {
			ajax = new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				ajax = new ActiveXObject("Microsoft.XMLHTTP");
			} catch(E) {
				ajax = false;
			}
		}
	}

	return ajax;
}