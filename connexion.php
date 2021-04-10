<?php 
  session_start();
  $_SESSION;
  //login page
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>


 <header>
</header>

    <body>

      <section>
        <?php
          //condition to offer either connection or send back to welcome page
          if(isset($_SESSION['user'])){
            header('Location:accueil.php');
          } else {
            ?>
            <div>
              <h2>Connexion</h2>
              <div>
                <form method="post" action="action/connexion.php">
                  <input type="text" name="username" placeholder="Nom d'utilisateur" required>
                  <input type="password" name="password" placeholder="Mot de passe" required>
                  <input class="button" type="submit" name="submit" value="Valider">
                </form>
              </div>
            </div>
        <?php
          }
        ?>
      </section>
    </body>
</html>
