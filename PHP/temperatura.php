<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Untitled 1</title>
</head>


<?php

$fahrenheit = NULL;
$celsius= 0;

if ($_SERVER["REQUEST_METHOD"] == "GET") {
  $fahrenheit = $_GET["fahrenheit"];
   }

?>


<body>

   <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="GET">
     Fahrenheit temperatura:
     <input type="text" name="fahrenheit" value="" /><br/>
     <input type="submit" value="Convertir a celsius!" />
   </form>
   
   
   
   <?php 
   if (!is_null($fahrenheit)) {
     $celsius = ($fahrenheit - 32) * 5 / 9;
     echo(" $fahrenheit es  $celsius grados celsius");
   } 
   ?>

   
   
</body>

</html>