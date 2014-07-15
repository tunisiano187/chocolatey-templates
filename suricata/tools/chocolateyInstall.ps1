
$packageName    = 'suricata' # arbitrary name for the package, used in messages
$installerType  = 'msi' #only one of these two: exe or msi
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$silentArgs     = '/quiet'

try {
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


