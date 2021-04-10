<?php
	session_start();
	$_SESSION;
	//delog of the user
	unset($_SESSION['user']);
	header('Location:../accueil.php');
?>