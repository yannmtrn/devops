<?php

require_once 'connectDB.php';

// appel de l'api pour récupérer les questions
$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => "http://localhost:8888/api/entreprises",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET"
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

$entreprises = json_decode($response, true);

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include './component/head.php'; ?>
    <title>Liste de diagnostic</title>
</head>
<header>
    <?php include './component/navbar.php'; ?>
</header>
<body>
    <div>
        <h1>Liste des entreprises</h1>
    </div>

    <table class="table table-striped col-12 ">
        <tr>
            <th>Entreprise</th>
        </tr>
        <?php

        foreach ($entreprises as $entreprise) {
            echo '<tr>';
            echo '<td class="text-wrap col-2"><a href="/entreprise?id='.$entreprise['id'].'">' . $entreprise['name'] . '</a></td>';
            echo '</tr>';
        }

        ?>
    </table>

</body>
</html>