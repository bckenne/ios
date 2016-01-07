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

if (isset ($_GET["id"], $_GET["name"]))
{
		$id = intval($_GET["id"]);
		$name =$_GET["name"];
}
$errorCount = 0;
if(empty($name))
{
    echo('name empty');
    $errorCount++;
}
if($errorCount == 0)
{
echo ('no errors');
//echo 'MySQL Connected successfully'."<BR>";
mysql_select_db("a4db_bjcr") or die(mysql_error());

$result = mysql_query("INSERT INTO Workouts (id, name)
 VALUES('$id', '$name')");
 
    
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