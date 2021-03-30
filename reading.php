<?php
  session_start();
  $_SESSION;

  require_once "action/config.php";
?>
Welcome <?php echo $_POST["country"]; ?><br>

