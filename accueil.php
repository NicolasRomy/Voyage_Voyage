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


  <nav class="barredenav">
    <a href="accueil.php">
      <div class="bouton b1"> Accueil </div>
    </a>

    <?php
    if (isset($_SESSION['user'])) { ?>
      <a href="action/deconnexion.php">
        <div class="bouton b6"> Déconnexion </div>
      </a>
      <a href="gestion_article.php">
        <div> gestion pays </div>
      </a>
      <a href="gestion_pays.php">
        <div> pannel article </div>
      </a>
    <?php } else { ?>
      <a href="connexion.php">
        <div> Connexion </div>
      </a>
    <?php
    }
    ?>

    <?php
    $sql = "SELECT * FROM countries";
    $pdo->query($sql);
    $pre = $pdo->prepare($sql);
    $pre->execute();
    $countryNameList = $pre->fetchAll(PDO::FETCH_ASSOC); ?>


    <div class="dropdown-content">
      <form action="reading.php" method="post">
        <select name='country'>
          <?php foreach ($countryNameList as $name) : ?>
            <option value="<?php echo $name["ID"] ?>"><?php echo $name["Name"] ?></option>
          <?php endforeach; ?>
        </select>
        <!-- <input type="option" id="<?php echo $name["ID"] ?>" name="ID"> -->
        <input type="hidden" id="custId" name="custId" value="<?php echo $name["ID"] ?>">
        <input type="submit" value='ENVOYER' />
      </form>
    </div>



  </nav>

</html>