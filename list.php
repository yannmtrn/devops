<?php

require_once 'connectDB.php';

$entreprises = getAllEntreprise();

?>

<!doctype html>
<html lang="fr">
<head>
    <?php include 'head.php'; ?>
    <title>Liste de diagnostic</title>
</head>
<header>
    <?php include 'navbar.php'; ?>
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
            echo '<td class="text-wrap col-2"><a href="entreprise.php?id='.$entreprise['id'].'">' . $entreprise['name'] . '</a></td>';
            echo '</tr>';
        }

        ?>
    </table>

</body>
</html>