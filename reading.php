<?php
  session_start();
  $_SESSION;

  require_once "action/config.php";
  $CountryID =  $_POST["country"]
?>
 <?php  $sql= "SELECT * FROM articles WHERE Country_ID =:Country_ID";
            $databind = array(":Country_ID" => $CountryID);
            $pre = $pdo->prepare($sql);
            $pre->execute($databind);
            $article = $pre->fetchAll(PDO::FETCH_ASSOC);
            
 ?>
 <h1><?php echo $article[0]['Title']?></h1>
