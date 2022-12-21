<!doctype html>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <?php include_once 'head.php'; ?>   
  </head>
<body <?php
//Dobra praksa otvoreno/zatvoreno unutar atributa elementa
echo 'style="background-color: gray"';
?>>
    <div class="grid-container">
      <?php require_once 'izbornik.php'; ?>
      <div class="grid-x grid-padding-x<?='"' //LOŠA PRAKSA ?>>
        <div class="large-12 cell">
            <?php // Dobra praksa je otvoriti/zatvoriti php unutar vrijednosti atributa  ?>
          <div class="<?='callout';?>" id="tijelo">
          <!-- Dobra praska je otvoriti i zatvoriti PHP unatar elementa  -->
          <?php 
          echo 'PHP na dobrom mjestu!'
          ?>
          </div>
        <?php echo '</div>'; // LOŠA PRAKSA: pojedine djelove elementa zatvarati/otvarati u php-u ?>
        <?php include_once 'podnozje.php'; ?>
      </div>
    </div>
   <?php include_once 'skripte.php'; ?>
  </body>
</html>