<?php 
	header( 'Cache-Control: no-cache' );
	header( 'Content-type: application/xml; charset="utf-8"', true );
	include("librariumCRUD.php");
    // Pegando o id do posto a ser pesquisado
    if(isset($_GET['livro_id'])) { // Se for chamado pelo arquivo totenfunctions.js
    	$clause = "where livro.ID = " . $_GET['livro_id'];
    } 

    try {
		$dao = new LibrariumCRUD();
    	$rs = $dao->runQuery("select livro.ID, livro.titulo, autor.nome as autor_nome, editora.nome as editora_nome, livro.descricao, livro.url, livro.paginas, livro.isbn from livro join autor on livro.autor_id = autor.id join editora on livro.editora_id = editora.id ".$clause);
	}catch (PDOException $e){
		echo $e->getMessage();
	}
	$url = "";

	while ($line = mysql_fetch_array($rs)) {
		$id = $line['ID'];
		$url = $line['url'];
		$titulo = $line['titulo'];
		$descricao = $line['descricao'];
		$autor = $line['autor_nome'];
		$editora = $line['editora_nome'];
		$isbn = $line['isbn'];
		$paginas = $line['paginas'];
	}
?>


<div class="content-reserva">
	<div class="content-left left">
		<?php
			echo "<img src='img/" . $url."'>";
		?>
	</div>
	<div class="content-right right">
		<h1 id="teste"><?php echo $titulo; ?></h1>
		<p><b>Descrição: </b><?php echo $descricao; ?></p>
		<p><b>Autor: </b><?php echo $autor; ?></p>
		<p><b>Editora: </b><?php echo $editora; ?></p>
		<p><b>ISBN: </b><?php echo $isbn; ?></p>
		<p><b>Nº de Páginas: </b><?php echo $paginas; ?></p>
	</div>
</div>

