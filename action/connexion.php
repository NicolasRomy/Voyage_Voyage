<?php
    session_start();
    $_SESSION;
    
    require_once "config.php";

    $sql = "SELECT * FROM admin WHERE PSEUDO='".$_POST['username']."' AND PASSWORD='".$_POST['password']."'";
    $pre = $pdo->prepare($sql);
    $pre->execute();
    $user = current($pre->fetchAll(PDO::FETCH_ASSOC));
    if(empty($user)) {
        header('Location:../connexion.php');
    } else {
        $_SESSION['user'] = $user;
    }

    if(isset($_SESSION['user'])) {
        header('Location:../accueil.php');
    }
?>