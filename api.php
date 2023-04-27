<?php

require 'connectDB.php';

function getEntrepriseAPI($id) {

    try {

        $pdo = connectDB();

        $sql = "SELECT id, name FROM Entreprise WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($result);

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}


function getAllEntrepriseAPI() {

    try {

        $pdo = connectDB();

        $sql = "SELECT id, name FROM Entreprise";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($result);

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getAllQuestionAPI() {

    try {

        $pdo = connectDB();

        $sql = "SELECT Axe.nom AS nom_axe, Categorie.nom AS nom_categorie, Question.texte AS texte_question, Question.texte_2_point, Question.texte_1_point, Question.texte_0_point FROM Axe INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id INNER JOIN Reponse ON Question.id = Reponse.question_id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($result);

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getQuestionReponseEntrepriseAPI($id, $axe) {

    try {

        $pdo = connectDB();

        $sql = "SELECT Categorie.nom, Question.texte AS texte_question, Question.texte_2_point, Question.texte_1_point, Question.texte_0_point, Reponse.point, Reponse.commentaire FROM Entreprise INNER JOIN Grille ON Entreprise.id = Grille.entreprise_id INNER JOIN Axe ON Grille.id = Axe.grille_id INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id INNER JOIN Reponse ON Question.id = Reponse.question_id WHERE Entreprise.id = :id AND Axe.nom = :axe";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(":id", $id);
        $stmt->bindParam(":axe", $axe);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($result);

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getCalculResAPI($id) {

    try {

        $pdo = connectDB();

        $sql = "SELECT Axe.nom, Reponse.point FROM Entreprise INNER JOIN Grille ON Entreprise.id = Grille.entreprise_id INNER JOIN Axe ON Grille.id = Axe.grille_id INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id INNER JOIN Reponse ON Question.id = Reponse.question_id WHERE Entreprise.id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(":id", $id);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);


        // récuperer les points par axe de $result
        $axe = array();
        foreach ($result as $key => $value) {
            $axe[$value['nom']][] = $value['point'];
        }

        // calculer le total de point par axe
        $total = array();
        foreach ($axe as $key => $value) {
            $total[$key] = array_sum($value);
        }

        header('Content-Type: application/json');
        // retourner le total de point par axe
        echo json_encode($total);

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}

function getAllDataEntreprise($id) {

    try {

        $pdo = connectDB();

        $sql = "SELECT Axe.nom AS nom_axe, Categorie.nom AS nom_categorie, Question.texte AS texte_question, Question.texte_2_point, Question.texte_1_point, Question.texte_0_point FROM Axe INNER JOIN Categorie ON Axe.id = Categorie.axe_id INNER JOIN Question ON Categorie.id = Question.categorie_id INNER JOIN Reponse ON Question.id = Reponse.question_id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($result);

    } catch (PDOException $e) {
        //display error
        die("ERROR: Could not connect. " . $e->getMessage());
    }

}