<?php
$servername = "192.168.10.10";
$username = "AndroidTracker";
$password = "geheim";
$dbname = "AndroidTracker";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT lat, lon, alt, Addtime FROM Cell ORDER BY Addtime DESC LIMIT 50";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo '<?xml version="1.0" encoding="UTF-8"?>';
  echo '<gpx version="1.0">' ;
  echo '<name>Android Location Track</name>';
  echo '<trk><name>Track</name><number>1</number><trkseg>\n';

  while($row = $result->fetch_assoc()) {
    echo "<trkpt lat=\"" . $row["lat"]. "\" lon=\"" . $row["lon"]. "\"><time>" . $row["Addtime"]. "</time></trkpt>\n";
  }
} else {
  echo "0 results";
}

echo "</trkseg></trk>";
echo "</gpx>";

$conn->close();
?>
