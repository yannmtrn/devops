<?php

require_once 'connectDB.php';

// get id from url
$id = $_GET['id'];

if ($id == null) {
    header('Location: index.php');
}

// get entreprise
$entreprise = getEntreprise($id);
$getAllQuestion = getAllQuestion($id);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include 'head.php'; ?>
    <title>Synthèse</title>
</head>
<header>
    <?php include 'navbar.php'; ?>
</header>
<body>

<div class="container">

    <a href="entreprise.php?id=<?php echo $id; ?>" class="btn btn-primary">Retour</a>

    <div>
        <h1>Synthèse</h1>
    </div>

    <div class="d-flex flex-row">
        <p>Axe compétence : </p>
        <?php
            $note_competence = getCalculRes("Compétence");
            echo '<p>'.$note_competence. '/27</p>';
        ?>
    </div>

    <div class="d-flex flex-row">
        <p>Axe réactivité : </p>
        <?php
        $note_reactivite = getCalculRes("Réactivité");
        echo '<p>'.$note_reactivite.'/33 </p>';
        ?>
    </div>

    <div class="d-flex flex-row">
        <p>Axe numérique : </p>
        <?php
        $note_numerique = getCalculRes("Numérique");
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