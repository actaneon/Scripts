<?
$playlistFilePath = "C:\Documents and Settings\jking\My Documents\My Music\iTunes\iTunes Music Library.xml";


function Missing($playlistFilePath, $outFile) {
  $fp = fopen($playlistFilePath, "r");
  $fpOut = fopen($outFile, "r+");

  while ($line = fgets($fp, 1024)) {
    //if (preg_match("/<key>Location<\/key><string>\/file:\/\/localhost\/(.*)\/<\/string>/", $line, $regs)) {
    //<key>Location</key><string>file://localhost/D://First%20Round%20Done/311/311%20-%20311%20-%2005%20-%20Hive.mp3/</string>

    if (preg_match("/<key>Location<\/key><string>file:\/\/localhost\/(.*)\/<\/string>/", $line, $regs)) {
      $file = $regs[1];
      $file = html_entity_decode($file); 
      $file = str_replace("&#38;", "&", $file);
      $file = urldecode($file);
      if (!file_exists($file)) {
	print ".";
	fputs($fpOut, "$file\r\n");
      }
    }
  }

  fclose($fp);
  fclose($fpOut);
}

function Diff() {
  $files = array("C:\Documents and Settings\jking\Desktop\iTunes Playlist\v1.xml",
		 "E:\My Documents\My Music\iTunes\iTunes Playlist\v2.xml");
  $pattern = "/<key>Location<\/key><string>file:\/\/localhost\/(.*)\/<\/string>/";

  for ($n = 0; $n < count($files); $n++) {
    $fp = fopen($files[$n], "r");
    while ($line = fgets($fp, 1024)) {
      if (preg_match($pattern, $line, $regs)) {
	$file = $regs[1];
	$file = html_entity_decode($file); 
	$file = str_replace("&#38;", "&", $file);
	$file = urldecode($file);
	$flist[$n][] = $file;
      }
    }
    fclose($fp);
    asort($flist[$n]);
  }

  $flist3 = array_diff($flist[0], $flist[1]);

  print_r($flist3);
}

function usage() {
  print "\nUsage: php -f ".$_SERVER[argv][0]." <PHP ARGS> -- <SCRIPT ARGS>\n\n";
  print "Script Args:\n";
  print "\t-d\tDiff\n";
  print "\t-h\tHelp\n";
  print "\t-m\tMissing <OUTFILE>\n";
}


if ($_SERVER[argv][2] == "-m")
  Missing($playlistFilePath, $_SERVER[argv][3]);
else if ($_SERVER[argv][2] == "-d")
  Diff();
else if ($_SERVER[argv][2] == "-h")
  usage();
else
  usage();

?>
