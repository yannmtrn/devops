<?php

require_once 'connectDB.php';

// get id from url
$id = $_GET['id'];

if ($id == null) {
    header('Location: index.php');
}

$getAllQuestion = getAllQuestion($id);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include 'head.php'; ?>
    <title>Axe compétence</title>
</head>
<header>
    <?php include 'navbar.php'; ?>
</header>
<body>

<div class="container">

    <a href="entreprise.php?id=<?php echo $id; ?>" class="btn btn-primary">Retour</a>

    <div>
        <h1>Réactivité</h1>
    </div>

    <table class="table table-striped col-12 ">
        <tr>
            <th>Items</th>
            <th>Questionnements</th>
            <th>2 points</th>
            <th>1 point</th>
            <th>0 point</th>
            <th>Note</th>
            <th>Commentaires/Justification</th>
        </tr>
        <?php

        foreach ($getAllQuestion as $question) {
            if ($question['nom_axe'] == 'Réactivité') {
                echo '<tr>';
                echo '<td class="text-wrap col-2">' . $question['nom_categorie'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_question'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_2_point'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_1_point'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_0_point'] . '</td>';
                echo '<td class="text-wrap col-1">' . $question['point'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['commentaire'] . '</td>';
                echo '</tr>';
            }
        }

        ?>
    </table>

</div>

</body>
</html>