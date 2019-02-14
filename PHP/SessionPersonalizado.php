<?php
session_start();

if (!isset($_SESSION["bgcol"])) {
    $_SESSION["bgcol"] = "white";
}

if (!isset($_SESSION["textCol"])) {
    $_SESSION["textCol"] = "black";
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Untitled 1</title>
</head>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bgCol = traduce($_REQUEST["bgCol"]);
    $textCol = traduce($_REQUEST["textCol"]);
    $_SESSION["bgCol"] = $bgCol;
    $_SESSION["textCol"] = $textCol;
 } 


function traduce($color)
{
    switch ($color) {
        case "rojo"     : return "red";
        case "verde"    : return "green";
        case "azul"     : return "blue";
        case "cian"     : return "cyan";
        case "amarillo" : return "yellow";
    }
}
?>

<body bgcolor="<?php echo $bgCol ?>" text="<?php echo $textCol ?>">


<h2>Elige los tus colores favoritos</h2>
<form action="<?php echo($_SERVER["PHP_SELF"]) ?>" method="post">
  <p>Color de fondo:
    <select name="bgCol">
      <option>rojo</option>
      <option>verde</option>
      <option>azul</option>
      <option>cian</option>
      <option>amarillo</option>
    </select></p>
  <hr />

  <p>Color del texto:
    <select name="textCol">
      <option>rojo</option>
      <option>verde</option>
      <option>azul</option>
      <option>cian</option>
      <option>amarillo</option>
    </select></p>
  <p><input type="submit" name="enviar" /></p>
</form>
</body>
</html>