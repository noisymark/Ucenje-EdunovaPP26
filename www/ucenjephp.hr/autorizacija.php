<?php $email = isset($_GET['email']) ? $_GET['email'] : (isset($_COOKIE['email']) ? $_COOKIE['email'] : ''); ?>

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
          <h4>Login page</h4>
          <hr><br><br>
          <form action="autoriziraj.php" method="post">
            <label for="email">E-mail: </label>
            <input type="email" name="email" id="email" value="<?=$email?>">
            <label for="password">Password: </label>
            <input type="password" name="password" id="password">
            <input style="color:black;background-color:lightblue;border-radius:15px;border:1px solid black;height:50px;width:100px;" type="submit" value="LOGIN">
          </form>
          </div>
        </div>
        <?php include_once 'podnozje.php'; ?>
      </div>
    </div>
   <?php include_once 'skripte.php'; ?>
  </body>
</html>