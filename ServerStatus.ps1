# Get status of the following servers: Apache2.4 and IIS7
# Author : Cristian Gabor
# Date : 08/11/2017
# Name: ServerStatus.ps1
# Discription : Retrive the status state of Apache and IIS from services.msc and retrive it
# in a status.txt file on D partition




$FileNameForDDrive="d:\status.txt"
$FileName = "status.tx"


$IIS = (get-service -name W3SVC).status
$Apache = (get-service -name Apache2.4).status

$date = get-date -DisplayHint Date

$text =  "Last checked status on " + $date 


$ISSservice = "IIS is: " + $IIS 
$Apacheservice = "Apache2.4 is: " + $Apache 
$None = ""

$dcheck = (Test-Path d:\)

if($dcheck -eq "True"){
    Write-Host "D drive checked and located!"
    $text | Add-Content $FileNameForDDrive
    $ISSservice | Add-Content $FileNameForDDrive
    $Apacheservice | Add-Content $FileNameForDDrive
    $None | Add-Content $FileNameForDDrive
}
else{
    Write-Host "D drive checked and not located!"
    $text | Add-Content $FileName
    $ISSservice | Add-Content $FileName
    $Apacheservice | Add-Content $FileName
    $None | Add-Content $FileName
}
