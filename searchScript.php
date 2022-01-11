<html>
<head> <title>Game Collection - Home</title>
</head>
<?php
	include('connection.txt');
	$conn = mysqli_connect($server,$user,$pass,$dbname, $port) or die('ERROR: Failed to connect to database');

	function print_arr($arr) {
		foreach($arr as $idx) {
			print "$idx ";
		}
	}

	function parse_values($conn, $table, $val) {
		$ret = array();
		$q = mysqli_query($conn, "SELECT * FROM ".$table.";") or die(mysqli_error($conn));
		while ($row = mysqli_fetch_array($q, MYSQLI_ASSOC)) {
			$x = $_POST[$row[$val]];
			if ($x != null) {
				$ret = array_merge($ret,array($x));
			}
		} mysqli_free_result($q);
		return $ret;
	}
?>
<body bgcolor="white">
	<hr>
	<h1>The Game Collection Database</h1>
	<h3>Were eclectic taste meets gaming history... eventually.</h3>
	<hr>
<?php
	$series = $_POST['id'];
	
	$q = mysqli_query($conn, "SELECT * FROM series WHERE sID=$series");
	$row = mysqli_fetch_assoc($q);
	$title = $row['sname'];
	mysqli_free_result($q);
	print "<h2>$title</h2>";
	
	$query_p1 = "SELECT * FROM series s JOIN meta_game mg ON s.sID=mg.series AND s.sID=$series JOIN game_port gp USING(gID) JOIN game_release gr USING(gID,pcID) WHERE gr.release_date=(SELECT";
	$query_p2 = "(gr.release_date) FROM series s JOIN meta_game mg ON s.sID=mg.series AND s.sname=@series JOIN game_port gp USING(gID) JOIN game_release gr USING(gID,pcID))";
	
	$q = mysqli_query($conn, $query_p1."min".$query_p2);
	$row = mysqli_fetch_assoc($q);
	print "<div><b>First Release(s):</b> ".$row[release_date]."</div>";
	print "<ul>";
	print "<li>$row[sname]: $row[pcID], $row[rID]</li>";
	while($row = mysqli_fetch_assoc($q)) {
		print "<li>$row[sname]: $row[pcID], $row[rID]</li>";
	}
	print "</ul>";
?>
	<hr>
</body>
</html>