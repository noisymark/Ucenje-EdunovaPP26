<?php

if($_POST['email']==='marko@pavlovic.hr' && $_POST['password']==='marko'){
    session_start();
    $_SESSION['auth']=true;
    setcookie('email',$_POST['email']);
    header('location: zasticeno.php');
}else{
    header('location: autorizacija.php?email=' . $_POST['email']);
}