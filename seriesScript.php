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
	$about = $row['about'];
	mysqli_free_result($q);
	print "<h2>$title</h2>";
	
	$query = "(gr.release_date) AS x FROM series s JOIN meta_game mg ON s.sID=mg.series AND s.sID=$series JOIN game_port gp USING(gID) JOIN game_release gr USING(gID,pcID)";
	
	$q = mysqli_query($conn, "SELECT min".$query);
	$row = mysqli_fetch_assoc($q);
	print "<div><b>First Release:</b> ".$row[x]."</div>";
	
	$q = mysqli_query($conn, "SELECT max".$query);
	$row = mysqli_fetch_assoc($q);
	print "<div><b>Most Recent (Recorded) Release:</b> ".$row[x]."</div>";
?>
	<hr>
	<h3>About:</h3> <p><?php print $about;?></p>
	<hr>
	<h3>Games:</h3>
	<table>
		<tr><th>Title</th> <th>Player No.</th> <th>Region</th> <th>Console</th> <th>Release Date</th> <th>Producer</th> <th>Developer</th></tr>
<?php
	$query = "SELECT gr.gname AS title, mg.players AS players, gr.rID AS region, gp.pcID AS console, gr.release_date AS rDate, p.cID AS producer, d.cID AS developer FROM series s JOIN meta_game mg ON s.sID=mg.series AND s.sID=$series JOIN game_port gp USING(gID) JOIN game_release gr USING(gID, pcID) JOIN company p ON gp.producer=p.cID JOIN company d ON gp.developer=d.cID;";
	$q = mysqli_query($conn, $query);
	while($row = mysqli_fetch_assoc($q)){
		print "<tr>";
		print "<td>$row[title]</td>";
		print "<td>$row[players]</td>";
		print "<td>$row[region]</td>";
		print "<td>$row[console]</td>";
		print "<td>$row[rDate]</td>";
		print "<td>$row[producer]</td>";
		print "<td>$row[developer]</td>";
		print "</tr>";
	}
?>
	</table>
	<hr>
	
</body>
</html>