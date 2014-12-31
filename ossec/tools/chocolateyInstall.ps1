
$packageName    = 'ossec'
$installerType  = 'exe'
$url            = 'http://www.ossec.net/files/ossec-agent-win32-2.8.exe'
$url64          = $url
$silentArgs     = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"

