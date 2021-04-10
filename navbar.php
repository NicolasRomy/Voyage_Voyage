<nav class="barredenav">
    <a href="accueil.php">
      <div class="bouton b1"> Accueil </div>
    </a>

    <?php
    //chooses either to show user login or logout 
    if (isset($_SESSION['user'])) { ?>
      <a href="action/deconnexion.php">
        <div class="bouton b6"> Déconnexion </div>
      </a>
      
      
    <?php } else { ?>
      <a href="connexion.php">
        <div> Connexion </div>
      </a>
    <?php
    }
    ?>

    <?php
    //fills the dropdown list
    $sql = "SELECT * FROM countries";
    $pdo->query($sql);
    $pre = $pdo->prepare($sql);
    $pre->execute();
    $countryNameList = $pre->fetchAll(PDO::FETCH_ASSOC); ?>

    <!-- physical form of the dropdown -->
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