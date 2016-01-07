<?php
 
$dbhostname = 'mysql1.cs.clemson.edu';
 
$dbusername = 'a4db_35ye';
 
$dbpassword = 'asdf1234';
 
$conn = mysql_connect($dbhostname, $dbusername, $dbpassword);
 
if(!$conn)
{
 
  die('Could not connect: ' . mysql_error());
 
}
echo ('connected');

if (isset ($_GET["id"], $_GET["workout"], $_GET["energy"], $_GET["ormax"], $_GET["date"]))
{
		$id = intval($_GET["id"]);
		$workout = intval($_GET["workout"]);
		$energy = intval($_GET["energy"]);	
		$ormax = intval($_GET["ormax"]);
       		$date = $_GET["date"];
}
$errorCount = 0;

 if(empty($ormax))
{
	echo ('ormax empty');
	$errorCount++;

}
if(empty($date))
{
    echo('date empty');
    $errorCount++;
}
if($errorCount == 0)
{
echo ('no errors');
//echo 'MySQL Connected successfully'."<BR>";
mysql_select_db("a4db_bjcr") or die(mysql_error());

$result = mysql_query("INSERT INTO Entries (id, workout, energy, ormax, date)
 VALUES('$id', '$workout', '$energy', '$ormax', '$date')");
 
    
if (!$result) {
    echo 'Could not run query: ' . mysql_error();
    exit;
}
mysql_close($conn);
}
else
{
mysql_close($conn);

}
