window.onload = hideModal;

function hideModal() {
	if(!getElement('modal')) return false;
	getElement('modal').style.display = "none";
	getElement('back-modal').style.display = "none";
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

function loadModal(id) {
	var close = getElement("close");
	var home_body = getElement('home_body');
	var btn_reservar = "";
	var btn_concluir = "";

	close.onclick = function() {
		$("#modal").slideUp();
		getElement('back-modal').style.display = "none";
	}

	var ajax = createAjax();

	ajax.open('GET', "resultModal.php?livro_id=" + id, true);

	ajax.onreadystatechange = function() {
		var box_details = getElement("box_details");
		getElement('back-modal').style.display = "";
		$("#modal").slideDown();

		if(ajax.readyState == 4 && ajax.status == 200) {
			box_details.innerHTML = ajax.responseText;
			$("#content_botton").hide();

			// Botão Reservar
			btn_reservar = getElement("btn_reservar");
			btn_reservar.onclick = function() {
				$("#content_botton").show(); // Exibindo a parte de reserva
			}			

			// Botão Concluir Reserva
			btn_concluir = getElement("btn_concluir");
			btn_concluir.onclick = function() {
				update();
				$("#content_botton").hide();
			}
		}
	}
	ajax.send();
}

function getElement(ID) {
	return document.getElementById(ID);
}

function getElements(tag) {
	return document.getElementsByTagName(tag);
}