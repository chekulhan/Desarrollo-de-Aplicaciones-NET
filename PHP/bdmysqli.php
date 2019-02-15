<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Untitled 1</title>
</head>

<body>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "classicmodels";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT *  FROM customers";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>ID</th><th>Nombre de Contacto</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
    echo '<tr>
	<td>'.$row["customerNumber"].'</td>
	<td>'.$row["contactFirstName"].'</td>
	<td>'.$row["contactLastName"].'</td>

	</tr>';    

    }
    echo "</table>";
} else {
    echo "0 results";
}
$conn->close();
?>
</body>

</html>
