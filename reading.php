<?php
  session_start();
  require_once "action/config.php";
  $CountryID =  $_POST["country"];
  //displays all the countries from the dropdown list
   $sql= "SELECT * FROM articles WHERE Country_ID =:Country_ID";
            $databind = array(":Country_ID" => $CountryID);
            $pre = $pdo->prepare($sql);
            $pre->execute($databind);
            $articles = $pre->fetchAll(PDO::FETCH_ASSOC);
            ?>
 
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
  <?php
  //loop to display title one by one and create unique link to articles
  foreach($articles as $article){
    ?>
     <h1><?php echo $article['Title']?></h1>
     <a href=<?php echo "article.php?id=".$article['ID'] ?> >Voir l'article</a>
     <?php } ?>
  </body>
  </html>