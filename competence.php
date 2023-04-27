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
    CURLOPT_URL => "https://172.16.47.122/api/question?id=$id&axe=competence",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET"
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

$getAllQuestion = json_decode($response, true);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include './component/head.php'; ?>
    <title>Axe compétence</title>
</head>
<header>
    <?php include './component/navbar.php'; ?>
</header>
<body>

    <div class="container">

        <a href="/entreprise?id=<?php echo $id; ?>" class="btn btn-primary">Retour</a>

        <div>
            <h1>Compétence</h1>
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
                echo '<tr>';
                echo '<td class="text-wrap col-2">' . $question['nom'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_question'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_2_point'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_1_point'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['texte_0_point'] . '</td>';
                echo '<td class="text-wrap col-1">' . $question['point'] . '</td>';
                echo '<td class="text-wrap col-2">' . $question['commentaire'] . '</td>';
                echo '</tr>';
            }

            ?>
        </table>

    </div>

</body>
</html>