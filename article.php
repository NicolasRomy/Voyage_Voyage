<?php 
session_start();
$_SESSION;
require_once "./action/config.php"; ?>

<html>
    <head>
        <meta charset="utf-8">
        <title>Accueil</title>
    </head>
    <body>
        <?php
            require "./navbar.php";
            //filtering the DB with the id of the article clicked by the user
            $sql= "SELECT * FROM articles WHERE id ='".$_GET['id']."'";
            $pre = $pdo->prepare($sql);
            $pre->execute();
            $article = $pre->fetchAll(PDO::FETCH_ASSOC);
        ?>


        <h1><?php echo $article['0']['Title']?></h1>
        <p>written on the <?php echo $article['0']['Article_content_date']?></p>
        <p>Posted on the <?php echo $article['0']['Publication_date']?></p>
        <img alt="Qries" src="<?php echo $article['0']["Image"] ?>">
        <p> <?php echo $article['0']["Content"] ?> </p>

        <!-- this sends data to the action files that creates the pdf  -->     
        <a href="./action/PDF.php?id=<?php echo $article['0']['ID']?>" >Télécharger</form></a><br>
        <?php
        //gets data that was choosen by the user and displays comments acordingly
        $sql= "SELECT * FROM comments WHERE article_id ='".$_GET['id']."'";
        $pre = $pdo->prepare($sql);
        $pre->execute();
        $comments = $pre->fetchAll(PDO::FETCH_ASSOC);
         ?>
        <?php
        //loop to show all the comments
        foreach($comments as $comment){
            ?>
             <p><?php echo $comment['DATE'] ?></p>
             <p><?php echo $comment['Pseudo'] ?></p>
             <p><?php echo $comment['Content'] ?></p>
             <?php } ?>
        </div><br>
        <!-- form to create comments (not functional)  -->  
        <form method="POST" action="">
			  <label for="fname">Date</label>
			<input type="date" name="date"  /><br /><br />
				<label for="lname">Pseudo</label>
			<input type="text" name="Pseudo"  /><br /><br />
				<label for="lname">Content</label>
			<textarea name="Content" ></textarea><br /><br />
			<input type="submit" value="Send !" />
		</form>
    </body>
</html>
