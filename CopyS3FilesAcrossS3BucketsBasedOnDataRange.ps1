$source = "s3://source/"
$destination = "s3://destination/"
aws s3 ls $source | Select-String "2022-03-04" | foreach {
    $filename = $_.Line.split(" ")[9]
    $srcfile = $source + $filename
    $dstfile = $destination + $filename
    aws s3 cp $srcfile  $dstfile --recursive
}