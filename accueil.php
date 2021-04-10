<?php
session_start();
$_SESSION;

require_once "action/config.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>



<header>
  
  <?php require "./navbar.php";?>
  <?php
        //thus select the highest id aka the last article posted
        $sql= "SELECT * FROM articles ORDER BY id DESC LIMIT 1";
        //fetching data from the article's database(DB)
        $pre = $pdo->prepare($sql);
        $pre->execute();
        $lastpost = $pre->fetchAll(PDO::FETCH_ASSOC);
     ?>
        <!-- display the article by fetching data from DB -->
        <h1> Last article posted <h1>
        <h2><?php echo $lastpost['0']['Title']?></h2>
        <p>written on the <?php echo $lastpost['0']['Article_content_date']?></p>
        <p>Posted on the <?php echo $lastpost['0']['Publication_date']?></p>
        <img alt="Qries" src="<?php echo $lastpost['0']["Image"] ?>">
        <p> <?php echo $lastpost['0']["Content"] ?> </p>

        
      

</html>