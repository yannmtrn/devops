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

function getEntreprise($id) {

    try {

        $pdo = connectDB();

        $sql = "SELECT id, name FROM Entreprise WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(":id", $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        return $result;

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getAllEntreprise() {

    try {

        $pdo = connectDB();

        $sql = "SELECT id, name FROM Entreprise";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getAllQuestion($id) {

    try {

        $pdo = connectDB();

        $sql = "SELECT Entreprise.id, Entreprise.name, Grille.id AS id_grille, Axe.nom AS nom_axe, Categorie.nom AS nom_categorie, Question.texte AS texte_question, Question.texte_2_point, Question.texte_1_point, Question.texte_0_point, Reponse.point, Reponse.commentaire FROM Entreprise INNER JOIN Grille ON Grille.entreprise_id = Entreprise.id INNER JOIN Axe ON Grille.id = Axe.grille_id INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id INNER JOIN Reponse ON Question.id = Reponse.question_id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getCalculRes($axe) {

    try {

        $pdo = connectDB();

        $sql = "SELECT Reponse.point, Reponse.commentaire FROM Grille INNER JOIN Axe ON Grille.id = Axe.grille_id INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id INNER JOIN Reponse ON Question.id = Reponse.question_id WHERE Axe.nom = :axe";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(":axe", $axe);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $total = 0;
        foreach ($result as $res) {
            $total += $res['point'];
        }

        return $total;

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}