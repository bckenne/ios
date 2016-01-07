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

if (isset ($_GET["id"]))
{
		$id = intval($_GET["id"]);
}
//echo 'MySQL Connected successfully'."<BR>";
mysql_select_db("a4db_bjcr") or die(mysql_error());

$result = mysql_query("DELETE FROM Entries WHERE id = '$id'");
 
    
if (!$result) {
    echo 'Could not run query: ' . mysql_error();
    exit;
}
mysql_close($conn);

