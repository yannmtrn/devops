<?php

// connect db localhost

/*const DB_HOST       = "localhost:8889";
const DB_USERNAME   = "root";
const DB_PASSWORD   = "root";*/
const DB_HOST       = "172.16.47.243:3306";
const DB_USERNAME   = "DOuser";
const DB_PASSWORD   = "resuOD";
const DB_NAME       = "devops";

function connectDB() {
    /*--------------------------
    A config page to be able to communicate with the backend database
    ----------------------------*/

    /* Attempt to connect to MySQL database */
    try {
        //PDO = Php Data Objects : Php extension
        $DBpdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USERNAME, DB_PASSWORD);
        // Set the PDO error mode to exception
        $DBpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $DBpdo;
    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }
}