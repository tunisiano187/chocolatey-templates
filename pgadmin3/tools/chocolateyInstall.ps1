$packageName    = 'pgadmin3'
$installerType  = 'msi' #only one of these two: exe or msi
$url            = 'http://nssm.cc/download/nssm-2.16.zip' # download url
$url64          = $url # 64bit URL here or just use the same as $url
$silentArgs     = "/quiet"
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

$zip_file = "pgadmin3-1.18.1.zip"
$zip_url  = "http://ftp.postgresql.org/pub/pgadmin3/release/v1.18.1/win32/$zip_file"
$msi_file = "pgadmin3.msi"

try {

  $chocTempDir   = Join-Path $env:TEMP "chocolatey"
  $tempDir       = Join-Path $chocTempDir "$packageName"
  $msi_file_temp = Join-Path $tempDir $msi_file
  $zip_file_temp = Join-Path $tempDir $zip_file

  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  Get-ChocolateyWebFile "$packageName" $zip_file_temp $zip_url $zip_url

  Get-ChocolateyUnzip $zip_file_temp $tempDir "" $packageName

  Install-ChocolateyPackage "$packageName" "$installerType" $silentArgs $msi_file_temp -validExitCodes $validExitCodes

  Write-ChocolateySuccess "$packageName"

} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
