<?php
    session_start();
    $_SESSION;
    
    require_once "config.php";
    require_once __DIR__ . '/vendor/autoload.php';

    $sql = "SELECT * FROM article WHERE id = ". $_Get["id"]."";
    $pre = $pdo->prepare($sql);
    $pre->execute();
    $article = current($pre->fetchAll(PDO::FETCH_ASSOC));

    $mpdf = new \Mpdf\Mpdf();
    $image = $article["Image"];

    $data = "";
    $data .=  $article["Title"] . "<br>";
    $data .=  "<img src = $image> <br>";
    $data .=  $article["content"] . "<br>";
    $data .=  $article["Publiacation_date"] . "<br>";
    $data .=  $article["Article_content_date"] . "<br>";

    $mpdf->WriteHtml($data);
    $mpdf->output("myfile.pdf","D");   




?>