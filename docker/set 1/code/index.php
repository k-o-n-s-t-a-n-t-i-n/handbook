<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 21.08.18
 * Time: 13:33
 */

 
$file = "text.txt";
//если файла нет... тогда
if (!file_exists($file)) {
    $fp = fopen($file, "w"); // ("r" - считывать "w" - создавать "a" - добовлять к тексту),мы создаем файл
    fwrite($fp, "Значение, то что будет в файле");
    fclose($fp);
}
echo "Hello world!";
