<?php
$servername = "192.168.10.10";
$username = "AndroidTracker";
$password = "geheim";
$dbname = "AndroidTracker";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if ( !isset($_GET["Unit"]) ) {
  $Unit="g3";
} else {
  $Unit=$_GET["Unit"];
}

if (!isset($_GET["Time"]) ) {
  $Time="2 Day";
} else {
  $TimeArea=$_GET["Time"];
  if ($TimeArea=="d") {
    $Time="1 Day";
  } else if ($TimeArea=="w") {
    $Time="7 Day";
  } else if ($TimeArea=="m") {
    $Time="30 Day";  
  } else {
    $Time="2 Day";
  }
}

$sql = "SELECT * FROM Cell WHERE User='${Unit}' AND UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL ${Time})) <= time ORDER BY Addtime ASC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  header("Content-Type: application/xml; charset=utf-8");
  printf("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
?>

<gpx version="1.0">
<name>Android Tracker</name>
<?php
  $CurrTrack=0;
  $CurrTrackTime=0;

  foreach ($result as $Row) {
    $EntryTime= strtotime($Row["Addtime"]);

    if ( ($EntryTime-$CurrTrackTime) >= 86400) { // 24h vergangen?
      if ($CurrTrack>0) {
        echo "</trk>";				// Track beenden
      }
      // Und neuen anfangen
      $CurrTrack=$CurrTrack+1;
      echo "<trk>";
      echo "<name>Track ", $CurrTrack, "</name><number>",$CurrTrack,"</number>";
      $CurrTrackTime=$EntryTime;
    }

    echo "<trkpt lat=\"" . $Row["lat"]. "\" lon=\"" . $Row["lon"]. "\">";
    echo "<time>" . $Row["Addtime"]. "</time>";
    echo "<ele>" . $Row["alt"] . "</ele>";
    echo "<speed>" . $Row["speed"] . "</speed>";
    echo "<dir>". $Row["dir"] . "</dir>";
    echo "</trkpt>\n";
  }
  echo "</trk>";
  echo "</gpx>";
} else {
  echo "0 results";
}
$conn->close();
?>
