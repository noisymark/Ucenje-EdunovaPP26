<?php

// Defining all the neccessary variables that will be used
$broj1 = isset($_GET['broj1']) ? $_GET['broj1'] : 0;
$broj2 = isset($_GET['broj2']) ? $_GET['broj2'] : 0;
// Converting strings to int type of value
$br1 = (int)$broj1;
$br2 = (int)$broj2;
// Caluclating the result of multiplication of these 2 numbers
$br3 = (int)($br1*$br2);
//Implementing a value to be filled in matrix
$val=1;
$a=[];

//br1 = broj stupaca 
//br2 = broj redova
//br3 = umnozak redova i stupaca

$pir = 0;
$zir = $br1;
$pis = 0;
$zis = $br2;

//pir = pocetni index reda
//zir = zavrsni index reda
//pis = pocetni index stupca
//zis = zavrsni index stupca

for($pir=0;$pir < $zir && $pis < $zis;){
        for($i = $zir; $i < $zis; ++$i){
                $a[$pir][$i] = $val++;
        }
        $pir++;

        for ($i = $pir; $i < $zir; ++$i){
            $a[$i][$zis - 1] = $val++;
        }
        $zis--;

        if ($pir < $zir)
        {
            for ($i = $zis - 1; $i >= $pis; --$i){
                $a[$zir - 1][$i] = $val++;
            }
            $m--;
        }

        if ($pis < $zis)
        {
            for ($i = $zir - 1; $i >= $pir; --$i)
                $a[$i][$pis] = $val++;
            $pis++;
        }

}


//echo '<pre>';
//var_dump($red);
//var_dump($stupac);
//echo '</pre>';

for ($i = 0; $i < $zir; $i++)
{
    for ($j = 0; $j < $zis; $j++)
    {
        echo ($a[$i][$j]);
        echo (" ");
    }
    echo ("\n");
}