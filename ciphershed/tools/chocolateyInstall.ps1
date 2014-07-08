
$packageName = 'ciphershed' # arbitrary name for the package, used in messages
$installerType = 'exe' #only one of these two: exe or msi
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/libra
ry/aa368542(VS.85).aspx
$silentArgs = '/S'

try {
  $downUrl = "https://ciphershed.org/download/CipherShed%20Setup%207.1a.exe"
  Echo "download url = $downUrl"
  # installer, will assert administrative rights
  #Install-ChocolateyPackage 'ciphershed' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$downUrl" -validExitCodes $validExitCodes
  
  # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
