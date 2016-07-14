<?php
	
    class LibrariumDB {

        private $link;

        public function connectDB() {
            try {
                $this->link = @mysql_connect("localhost", "root","") or die ("pqp");
                mysql_select_db("librarium") or die ("deu ruim");
            } catch(Exception $e) {
                echo "error".$e->getMessage("deu menos merda");
            }
        }

        public function closeConnection() {
            mysql_close();
        }
    }