<?php

session_start();
if(!$_SESSION['auth']){header('location: autoriziraj.php');}

?>

<!doctype html>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <?php include_once 'head.php'; ?>   
  </head>
<body>
    <div style="background-color:lightcyan" class="grid-container">
      <div class="grid-x grid-padding-x">
        <div class="large-12 cell">
          <div style="text-align:center;" class="callout" id="tijelo">
          <h4>Logged-in page</h4>
          <hr><br><br>
          <a href="odjava.php">LOGOUT</a>
          </div>
        </div>
        <?php include_once 'podnozje.php'; ?>
      </div>
    </div>
   <?php include_once 'skripte.php'; ?>
  </body>
</html>