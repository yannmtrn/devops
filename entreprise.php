<?php

require_once 'connectDB.php';

// get id from url
$id = $_GET['id'];

if ($id == null) {
    header('Location: index.php');
}

// get entreprise
$entreprise = getEntreprise($id);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include 'head.php'; ?>
    <title><?php echo $entreprise["name"]; ?></title>
</head>
<header>
    <?php include 'navbar.php'; ?>
</header>
<body>

    <div>
        <?php
            echo "Entreprise: ".$entreprise["name"];
        ?>
    </div>

    <a href="competence.php?id=<?php echo $entreprise['id']; ?>">Axe compétence</a><br>
    <a href="reactivite.php?id=<?php echo $entreprise['id']; ?>">Axe réactivité</a><br>
    <a href="numerique.php?id=<?php echo $entreprise['id']; ?>">Axe innovation</a><br>

    <a href="synthese.php?id=<?php echo $entreprise['id']; ?>">Synthèse</a>

</body>
</html>