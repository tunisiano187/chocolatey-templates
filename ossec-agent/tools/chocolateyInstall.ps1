
$packageName    = 'ossec'
$installerType  = 'exe'
$url            = 'http://www.ossec.net/files/ossec-agent-win32-2.8.exe'
$url64          = $url
$checksum       = "a699117d0ed77f88b3a8661644ee3efd"
$silentArgs     = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -checksum $checksum -validExitCodes $validExitCodes
