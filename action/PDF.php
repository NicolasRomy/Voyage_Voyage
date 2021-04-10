<?php 
require_once '../vendor/autoload.php';
require_once "./config.php"; 
$sql = "SELECT * FROM articles WHERE id = ".$_GET['id']."";
$pre = $pdo->prepare($sql);
$pre->execute();
$article = $pre->fetchAll(PDO::FETCH_ASSOC);


$title = $article['0']['Title'];
$content = $article['0']['Content'];
$date = $article['0']['Publication_date'];
$datep = $article['0']['Article_content_date'];
$img = $article['0']['Image']; 
$country = $article['0']['Country_id'];


// Associate all article elements for mpdf
$mpdf = new \Mpdf\Mpdf();

$data = '';
$data .= $title;
$data .= '<br>';
$data .= $content;
$data .= $date;
$data .= $country;
$data .= '<br>';
$data .= $datep;

// Write some HTML code:
$mpdf->WriteHTML($data);
$mpdf->Image($img, 50, 30, 50, 50, 'jpg', '', true, false);

// Output a PDF file directly to the browser
$mpdf->Output('blog.pdf', 'D');
?>