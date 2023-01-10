<!doctype html>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <?php include_once 'head.php'; ?>   
  </head>
<body>
    <div class="grid-container">
      <?php 
      // čitati https://www.simplilearn.com/tutorials/php-tutorial/include-in-php
      require_once 'izbornik.php'; ?>
      <div class="grid-x grid-padding-x">
        <div class="large-12 cell">
          <div class="callout" id="tijelo">
          
<?php
$broj1 = isset($_GET['broj1']) ? $_GET['broj1'] : 0;
$broj2 = isset($_GET['broj2']) ? $_GET['broj2'] : 0;
$broj3 = isset($_GET['broj3']) ? $_GET['broj3'] : 0;
$text1 = 'Najmanji broj je: ';
$text2 = '<br>';
$text3 = 'Svi brojevi su jednaki!';

if($broj1 < $broj2 && $broj1 < $broj3){
    echo $text1 , $broj1 , $text2;
} else if ($broj2 < $broj1 && $broj2 < $broj3){
    echo $text1 , $broj2 , $text2;
} else if ($broj1 === $broj2 && $broj2 === $broj3){
    echo $text3 , $text2;
} else if ($broj3 < $broj2 && $broj3 < $broj1){
    echo $text1 , $broj3 , $text2;
}
?>

          </div>
        </div>
        <?php include_once 'podnozje.php'; ?>
      </div>
    </div>
   <?php include_once 'skripte.php'; ?>
  </body>
</html>