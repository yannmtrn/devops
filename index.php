<?php

require_once 'connectDB.php';

// get id from url
$id = $_GET['id'];

if ($id == null) {
    header('Location: list.php');
}

// get entreprise
$entreprise = getEntreprise($id);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include 'head.php'; ?>
    <title>devops v1.5</title>
</head>
<header>
    <?php include 'navbar.php'; ?>
</header>
<body>

    <div class="container d-flex flex-column justify-content-center align-items-center col-8">

        <div>
            <?php
                echo "Entreprise: ".$entreprise["name"];
            ?>
        </div>

        <a href="competence.php" class="btn btn-primary">Suivant</a>

    </div>

</body>
</html>