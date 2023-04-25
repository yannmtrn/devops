<?php

// connect db localhost

const DB_HOST       = "172.16.47.139:3306";
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

function getAllQuestion() {

    try {

        $pdo = connectDB();

        $sql = "SELECT Grille.id AS id_grille, Axe.nom AS nom_axe, Categorie.nom AS nom_categorie, Question.texte AS texte_question, Question.texte_2_point, Question.texte_1_point, Question.texte_0_point FROM Grille INNER JOIN Axe ON Grille.id = Axe.grille_id INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }
}

$datas = getAllQuestion();

print_r($datas);

/*foreach ($datas as $data) {
    echo $data['nom_entreprise'] . " " . $data['id_grille'] . " " . $data['nom_axe'] . " " . $data['nom_categorie'] . " " . $data['texte_question']."\n";
}*/