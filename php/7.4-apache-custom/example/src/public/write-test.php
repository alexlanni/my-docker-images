<?php

$fo = fopen('./text.txt', 'a+');

fwrite($fo, 'ciao');

fclose($fo);
