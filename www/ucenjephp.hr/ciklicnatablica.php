<?php

// Defining all the neccessary variables that will be used
$broj1 = isset($_GET['broj1']) ? $_GET['broj1'] : 0;
$broj2 = isset($_GET['broj2']) ? $_GET['broj2'] : 0;
// Converting strings to int type of value
$br1 = (int) $broj1;
$br2 = (int) $broj2;
// Caluclating the result of multiplication of these 2 numbers
$br3 = (int) $br1 * $br2;
//Implementing an empty array
$aa=[];
// For every instance of the loop adding the current loop number to the end of the array
// So that in the end, the array will start with the highest number and end with 0
for($i=$br1*$br2;$i>0;$i--){
    array_push($aa,$i);
}
// Displaying the results in RAW mode
echo '<pre>';
var_dump($aa);
echo '</pre>';

echo '<table style="text-align:center;">';
for($i=$br2;$i>0;$i--){
    echo '<tr>';
        for($j=$br1;$j>0;$j--){
            echo '<td>' . $br3 . '</td>';
            $br3-=1;
        }
    echo '</tr>';
}
echo '</table>';