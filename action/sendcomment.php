<?php/* this is an attempt at creating new comments
require_once "config.php";
$sql = "INSERT INTO comments(DATE,Pseudo,Content,articles_ID) VALUES(:DATE,:Pseudo,:Content,:Article_ID)";
$dataBinded=array(
    ':DATE'   => $_POST['DATE'],
    ':Pseudo'   => $_POST['Pseudo'],
    ':content'=> $_POST['content'],
    ':articles_id'=> $_POST['id']
);
$pre = $pdo->prepare($sql);
$pre->execute($dataBinded);

header('Location:article.php');
*/?>
