

$packageName    = 'suricata'
$installerType  = 'msi'
$validExitCodes = @(0)
$silentArgs     = '/quiet'

try {
  Echo "Downloading and Installing Suricata"
  $downUrl = "https://redmine.openinfosecfoundation.org/attachments/download/1033/Suricata-2.0.2-1-32bit.msi"
  Echo "download url = $downUrl"
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$downUrl" -validExitCodes $validExitCodes
  # Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$downUrl" "$downUrl64"  -validExitCodes $validExitCodes
  # Install-ChocolateyZipPackage "$packageName" "$downUrl" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$downUrl64"
  
  # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}


