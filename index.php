<?php

require_once 'api.php';

$urlpath = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

switch ($urlpath) {
    case '':
    case '/':
        require("./list.php");
        break;
    case '/entreprise':
        require("./entreprise.php");
        break;
    case '/competence':
        require("./competence.php");
        break;
    case '/reactivite':
        require("./reactivite.php");
        break;
    case '/numerique':
        require("./numerique.php");
        break;
    case '/synthese':
        require("./synthese.php");
        break;
    case '/api/entreprise':
        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo "400 Bad Request";
            break;
        }
        $id = $_GET['id'];
        getEntrepriseAPI($id);
        break;
    case '/api/entreprises':
        getAllEntrepriseAPI();
        break;
    case '/api/question':
        if (!isset($_GET['id']) || !isset($_GET['axe'])) {
            http_response_code(400);
            echo "400 Bad Request";
            break;
        }
        $id = $_GET['id'];
        $axe = $_GET['axe'];
        getQuestionReponseEntrepriseAPI($id, $axe);
        break;
    case '/api/questions':
        getAllQuestionAPI();
        break;
    case '/api/synthese':
        if (!isset($_GET['id'])) {
            http_response_code(400);
            echo "400 Bad Request";
            break;
        }
        $id = $_GET['id'];
        getCalculResAPI($id);
        break;
    default:
        http_response_code(404);
        echo "404 Not Found";
        break;
}