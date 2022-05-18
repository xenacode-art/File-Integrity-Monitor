Write-Host ""

Write-Host "What would you like to do?"
Write-Host ""
Write-Host "A) Collect new Baseline?"
Write-Host "B) Begin monitoring Files with BaseLine?"
Write-Host ""

$response = Read-Host -Prompt "Please enter 'A' or ' B' "
Write-Host ""

Function  Calculate-File-Hash($filepath) {
  $filepath = Get-FileHash -Path $filepath -Algorithm SHA512
  return $filepath
}

 Function Erase-Baseline-If-Already-Exists() {
  $baselineExists = Test-Path -Path .\baseline.txt


  if($baselineExits) {
    #Delete it
    Remove-Item -Path .\baseline.txt
   }
 }

 if ($response -eq "A".ToUpper()) {

  #Delete baseline.txt if it already exists
  Erase-Baseline-If-Already-Exists

 # Calc Hash from target files and store in baseline.txt
 # collect all file in the target folder
  $files = Get-ChildItem -Path .\Files