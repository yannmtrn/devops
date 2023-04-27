<?php

require_once 'connectDB.php';

// get id from url
$id = $_GET['id'];

if ($id == null) {
    header('Location: /');
}

// Appel de l'api pour récupérer l'entreprise
$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => "https://172.16.47.122/api/entreprise?id=$id",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
    CURLOPT_SSL_VERIFYPEER => false
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

$entreprise = json_decode($response, true);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include './component/head.php'; ?>
    <title><?php echo $entreprise[0]["name"]; ?></title>
</head>
<header>
    <?php include './component/navbar.php'; ?>
</header>
<body>

    <div>
        <?php
            echo "Entreprise: ".$entreprise[0]["name"];
        ?>
    </div>

    <a href="/competence?id=<?php echo $entreprise[0]['id']; ?>">Axe compétence</a><br>
    <a href="/reactivite?id=<?php echo $entreprise[0]['id']; ?>">Axe réactivité</a><br>
    <a href="/numerique?id=<?php echo $entreprise[0]['id']; ?>">Axe numérique</a><br>

    <a href="/synthese?id=<?php echo $entreprise[0]['id']; ?>">Synthèse</a>

</body>
</html>