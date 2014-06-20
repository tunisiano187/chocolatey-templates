
$packageName = 'truecrypt' # arbitrary name for the package, used in messages
$installerType = 'exe' #only one of these two: exe or msi
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/libra
ry/aa368542(VS.85).aspx
$silentArgs = '/S'

try {
#  # obtain download id from web
#  [void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
#  # $url = 'http://www.truecrypt.org/downloads'
#  $url = 'https://https://www.grc.com/misc/truecrypt/truecrypt.htm'
#  $webReq = [Net.HttpWebRequest]::Create("$url")
#  $webReq.Method = "GET"
#  
#  $webRes = $webReq.GetResponse()
#  $sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
#  $content = $sr.ReadToEnd()
#  $sr.Close()
#  $webRes.Close()
#
#  if($content -match 'name="LinkT" value="([0-9a-z]+)">')
#  {
#     $did = "$($matches[1])"
#     Echo "download id = $did"
#  }

  # $downUrl = "http://www.truecrypt.org/download/transient/${did}/TrueCrypt%20Setup%207.1a.exe"
  $downUrl = "https://www.grc.com/misc/truecrypt/TrueCrypt%20Setup%207.1a.exe"
  Echo "download url = $downUrl"
  # installer, will assert administrative rights
  #Install-ChocolateyPackage 'truecrypt' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$downUrl" -validExitCodes $validExitCodes
  
  # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
