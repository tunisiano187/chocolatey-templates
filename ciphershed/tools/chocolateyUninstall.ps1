try {
  $unpath = "${Env:ProgramFiles}\CipherShed\CipherShed Setup.exe"
  # installer, will assert administrative rights
  Uninstall-ChocolateyPackage 'ciphershed' 'EXE' '/u' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'ciphershed'
} catch {
  Write-ChocolateyFailure 'ciphershed' "$($_.Exception.Message)"
  throw 
}
