<?php 
            $rss=isset($_GET['broj1']) ? $_GET['broj1'] : 0;
            $css=isset($_GET['broj2']) ? $_GET['broj2'] : 0;

            $rows=(int)$rss;
            $columns=(int)$css;

            if($rows===0 || $columns===0){
                echo 'UNESITE OBA BROJA KAO VALJANU VRIJEDNOST CIJELOG BROJA!';
            }

            $maxRow=$rows-1;
            $maxCol=$columns-1;
            $ispis=1;
            $matrica=[];
            $minCol=0;
            $minRow=0;
            while ($ispis <= $rows*$columns) 
            {
                for($j=$maxCol; $j >= $minCol; $j--)
                {
                    $matrica[$maxRow][$j] = $ispis++;
                }
                    $maxRow--;
                    if ($ispis > $rows*$columns) break;

                for ($i=$maxRow; $i >= $minRow ;$i--) 
                { 
                    $matrica[$i][$minCol] = $ispis++;
                }
                    $minCol++;
                    if ($ispis > $rows*$columns) break;

                for ($j=$minCol; $j <= $maxCol; $j++) 
                { 
                    $matrica[$minRow][$j] = $ispis++;
                }
                    $minRow++;
                    if ($ispis > $rows*$columns) break;
                for ($i=$minRow; $i <= $maxRow; $i++) 
                { 
                    $matrica[$i][$maxCol] = $ispis++;
                }
                    $maxCol--;    
            
            }

echo '<table style="text-align:center;">';
        for($i=0;$i<$rows;)
        {
          echo '<tr>';
            for ($j=0; $j < $columns;) 
            { 
              echo '<td>'. $matrica[$i][$j] .'</td>';
              $j++;
            }
            echo '</tr>';
            $i++;
        } 
echo '</table>';
