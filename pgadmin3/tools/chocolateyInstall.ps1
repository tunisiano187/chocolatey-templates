$packageName    = 'pgadmin3'
$installerType  = 'msi' #only one of these two: exe or msi
$silentArgs     = "/quiet"
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

$zip_file = "pgadmin3-1.20.0.zip"
$zip_url  = "http://ftp.postgresql.org/pub/pgadmin3/release/v1.20.0/win32/$zip_file"
$msi_file = "pgadmin3.msi"



$chocTempDir   = Join-Path $env:TEMP "chocolatey"
$tempDir       = Join-Path $chocTempDir "$packageName"
$msi_file_temp = Join-Path $tempDir $msi_file
$zip_file_temp = Join-Path $tempDir $zip_file

Write-Host "pgAdmin3 Installer:"
Write-Host "  * Package...........: $packageName"
Write-Host "  * Choco Temp........: $chocoTempDir"
Write-Host "  * Temp Dir..........: $tempDir"
Write-Host "  * MSI Temp..........: $msi_file_temp"
Write-Host "  * Zip Temp..........: $zip_file_temp"
Write-Host "  * Zip File..........: $zip_file"
Write-Host "  * Zip URL...........: $zip_url"
Write-Host "  * MSI File..........: $msi_file"
Write-Host "  * ChocolateyInstall.: $env:ChocolateyInstall"
Write-Host ""

if ("x$env:ChocolateyInstall" -eq "x") {
  Write-ChocolateyFailure "$packageName" "The ChocolateyInstall Environment variable is NOT SET!, Get-ChocolateyUnzip requires the ChocolateyInstall environment variable and this installation can NOT continue without it. Set ChocolateyInstall=C:\Chocolatey"
  }

if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

try {  
  Write-Host ""
  Write-Host "Downloading $packageName"
  Write-Host "  * Zip File Temp: $zip_file_temp"
  Write-Host "  * Zip URL......: $zip_url"
  Write-Host ""
  Get-ChocolateyWebFile "$packageName" $zip_file_temp $zip_url $zip_url
} catch {
  Write-ChocolateyFailure "$packageName" "Could not download zip file to $zip_file_temp. REASON: $($_.Exception.Message)"
  throw 
}


try {
  Write-Host ""
  Write-Host "Unzipping file"
  Write-Host "  * FROM: $zip_file_temp"
  Write-Host "  * TO..: $tempDir"
  Write-Host ""
  Get-ChocolateyUnzip "$zip_file_temp" "$tempDir"
} catch {
  Write-ChocolateyFailure "$packageName" "Could not unzip zip file. REASON: $($_.Exception.Message)"
  throw
}

try {  
  Install-ChocolateyPackage "$packageName" "$installerType" $silentArgs $msi_file_temp -validExitCodes $validExitCodes
} catch {
  Write-ChocolateyFailure "$packageName" "Could not install msi. REASON: $($_.Exception.Message)"
  throw 
}

  Write-ChocolateySuccess "$packageName"

