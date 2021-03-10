$inputHost = Read-Host -Promt "What would you like to do, encrypt or decrypt a file?`n
 - For encryption type 'ver' in the command line`n
 - For decryptoin type 'ent' in the command line`n
Please type it in correctly!"

if ($inputHost.Contains("ver") -and $inputHost.Length -eq 3) {
    .\Base64\ver.ps1
    Write-Host "Your text has been successfully encrypted into Base64.`n
It has been stored in the file 'encrypted.txt'" -foregroundcolor "green"

} elseif ($inputHost.contains("ent") -and $inputHost.Length -eq 3) {
    .\Base64\ent.ps1
    Write-Host "Your text has been successfully decrypted into clear text.`n
It has been stored in the file 'decrypted.txt'" -foregroundcolor "green"

} else {
    Write-Host "Input not valid" -ForegroundColor "red"
}