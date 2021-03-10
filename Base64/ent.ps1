<#

.Synopsis
    This is a script which will dencrypt text.
.DESCRIPTION
    This script will decrypt the text that has been encrypted in 'encryptet.txt'. First it will convert the Base64 String into Ascii values, then it will create an array out of the objects,
    next it iritate trugh each object in that array ($data1). When iritating trough them it will subract 120 for each of them and save the output into a new array ($data1 -> $ArrayToString).
    In the end, all objects of this array are put together in such a way that they become one string.

#>

######################################

#Script Name:   ent.ps1
#Creator:       Luka Joksimovic
#Created:       07.03.2021  
#Updated:       08.03.2021, 09.03.2021

######################################

# Passing the content from 'encrypt.ps1' to this file, in order to be in the same scope
. .\Base64\key.ps1

# Store the content from 'test.txt' into $file
$file = ".\Base64\encrypted.txt"

# Gets the content from the file and saves it into $data
$data = Get-Content $file

# The content inside $data gets converted back into the ascii values
$data = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($data))

# Because every value in '$data' is seperated by a spacebar now, we will use .Split(' ') to create an array of objects and there where the space is, is where the new Object is created
$data1 = $data.Split(' ')

$ArrayToString = @()

# For every item in $data1 it will subtract the key and convert it from ascii into characters, they will then be saved into a new array
foreach ($item in $data1){
    $zwi = $item - $key
    $saved = [char]$zwi
    $arrayToString += $saved
}
# Save content to variable. / Because the varaible '$arrayToString' is still an array, we want it to become a string rather then to stay an array, this will be achived with the '-join' operator
$decrypt = $arrayToString -join ''

# The output from '$encrypt' will be piped into a file called 'encrypted.txt'
$decrypt | Out-File -FilePath .\Base64\decrypted.txt