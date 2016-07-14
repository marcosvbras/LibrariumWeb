<!DOCTYPE html>
<html>
<head>
	<title>Busca de Livros</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta charset="UTF-8"/>
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/functions.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<script type="text/javascript">
			$(document).ready(function(){
				// document.getElementById("station").style.visibility = "hidden";
				document.getElementById("MostraPesq").style.display = "none";
			    //Aqui a ativa a imagem de load
			    function loading_show(){
					$('#loading').html("<img class='img-loader' src='img/ajax_loader_red_512.gif'/>").fadeIn('slow');
			    }
			    //Aqui desativa a imagem de loading
			    function loading_hide(){
			        $('#loading').fadeOut('fast');
			    }       
			    // aqui a função ajax que busca os dados em outra pagina do tipo html, não é json
			    function load_dados(valores, page, div)
			    {
			        $.ajax
			            ({
			                type: 'POST',
			                dataType: 'html',
			                url: page,
			                beforeSend: function(){//Chama o loading antes do carregamento
					              loading_show();
							},
			                data: valores,
			                success: function(msg)
			                {
			                    loading_hide();
			                    var data = msg;
						        $(div).html(data).fadeIn();				
			                }
			            });
			    }			    
			    //Aqui eu chamo o metodo de load pela primeira vez sem parametros para pode exibir todos
			    load_dados(null, 'search.php', '#MostraPesq');
			    //Aqui uso o evento key up para começar a pesquisar, se valor for maior q 0 ele faz a pesquisa
			    $('#searchStation').keyup(function(){
			        var values = $('#form_pesquisa').serialize()//o serialize retorna uma string pronta para ser enviada
			        //pegando o valor do campo #searchStation
			        var $parametro = $(this).val();
			        document.getElementById("MostraPesq").style.display = "";

			        if($parametro.length >= 1) {
			            load_dados(values, 'search.php', '#MostraPesq');
			        }else {
			            // load_dados(null, 'search.php', '#MostraPesq');
			            document.getElementById("MostraPesq").style.display = "none";
			        }
			    });


			    $(window).scroll(function() {
					if ($(this).scrollTop() > 1){  
				    	$('#img-logo').fadeOut('faster');
				  	} else {
				     	$('#img-logo').fadeIn('faster');
				  	}
				});
			});
		</script>
</head>
<body class="white_body" id="home_body">
	<header>
		<img src="img/white_logo.png" id="img-logo" class="align-center">
		<form name="form_pesquisa" id="form_pesquisa" method="post" action="">
			<input name="searchStation" id="searchStation" type="text" class="search-box align-center" placeholder="Pesquisar um livro">
		</form>
	</header>
	<div id="container" class="container">
		<div id="loading" class="container-loader" ></div>
		<div id="MostraPesq"></div>
		<div id="back-modal" class="back-modal"></div>
		<div id="modal" class="modal"> 
			<p class="close" id="close">×</p>
			<div id="box_details"></div>
		</div>
	</div>
	<footer>
		<img class="align-center" src="img/logo_senai.png">
	</footer>
</body>
</html>