<?php
	header('Content-Type: text/html; charset=iso-8859-1'); 
	header( 'Content-type: application/xml; charset="utf-8"', true );
	$clause = "";
	$msg = "";

	if(isset($_POST['searchStation'])) {
		$clause = "where titulo like '%". $_POST['searchStation'] . "%' order by titulo";
	} else {
		$clause = "";
	}			
	
	//requerimos a classe de conexão
	include("librariumCRUD.php");
	
	try {
		$dao = new LibrariumCRUD();
    	$result = $dao->runQuery("select * from livro ".$clause);
	}catch (PDOException $e){
		echo $e->getMessage();
	}	
	
	//resgata os dados na tabela
	if(mysql_num_rows ($result) > 0 ) {
		while ($line = mysql_fetch_array($result)) {
			$id = $line['ID'];
			$msg .="<div onclick='loadModal(" . $id .")' class='item left'>";
			$msg .="	<img src='img/".$line['url']. "'>";
			$msg .="	<p>". utf8_encode($line['titulo'])."</p>";
			$msg .="</div>";
		}
	} else {
		$msg = "";
		$msg .="<h3 class='align-center'>Nenhum livro foi encontrado...</h3>";
	
	}
	//retorna a msg concatenada
	echo $msg;
?>