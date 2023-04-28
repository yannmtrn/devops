<?php

require_once 'connectDB.php';

// get id from url
$id = $_GET['id'];

if ($id == null) {
    header('Location: /');
}

// appel de l'api pour récupérer les questions
$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => "https://172.16.47.122/api/synthese?id=$id",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_SSL_VERIFYHOST => 0
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

$getAllRes = json_decode($response, true);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include './component/head.php'; ?>
    <title>Synthèse</title>
</head>
<header>
    <?php include './component/navbar.php'; ?>
</header>
<body>

<div class="container">

    <a href="/entreprise?id=<?php echo $id; ?>" class="btn btn-primary">Retour</a>

    <div>
        <h1>Synthèse</h1>
    </div>

    <div class="d-flex flex-row">
        <p>Axe compétence : </p>
        <?php
            $note_competence = $getAllRes["Compétence"];
            echo '<p>'.$note_competence. '/27</p>';
        ?>
    </div>

    <div class="d-flex flex-row">
        <p>Axe réactivité : </p>
        <?php
        $note_reactivite = $getAllRes["Réactivité"];
        echo '<p>'.$note_reactivite.'/33 </p>';
        ?>
    </div>

    <div class="d-flex flex-row">
        <p>Axe numérique : </p>
        <?php
        $note_numerique = $getAllRes["Numérique"];
        echo '<p>'.$note_numerique.'/60</p>';
        ?>
    </div>

    <div style="width: 500px; margin: auto">
        <canvas id="myChart"></canvas>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('myChart');
        //On récupère le contenu des divs cachées
        const reactivite = <?php echo $note_reactivite; ?>;
        const competences = <?php echo $note_competence; ?>;
        const numerique = <?php echo $note_numerique; ?>;
        new Chart(ctx, {
            type: 'radar',
            data: {
                labels: ['Axe réactivité', 'Axe compétences', 'Axe numérique'],
                datasets: [{
                    label: 'Score',
                    data: [reactivite, competences, numerique],
                    borderWidth: 2
                }]
            },
            options: {
                scales: {
                    r: {
                        suggestedMin: 0,
                        suggestedMax: 60
                    }
                },
            }
        });
    </script>

</div>

</body>
</html>