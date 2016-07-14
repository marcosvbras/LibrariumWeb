<?php
	class LibrariumCRUD {
		function __construct() 
	    {
	        include "connection.php";
	    }

	    public function runQuery($sql) {
            $connection = new LibrariumDB();
	        $connection->connectDB();
            $result = mysql_query($sql);
            $connection->closeConnection();
            return $result;
        }
	}
?>