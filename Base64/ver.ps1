<#

.Synopsis
    This is a script which will encrypt text.
.DESCRIPTION
    This script will encrypt a specific Text from the file 'input.txt' and will first convert it to ascii and then to Base64. 
    There is also a key which will add up to the asscii value.  Only people with the key can decrypt it.
    For example the ascii value of 'H' is '72'. If we now have a key with the value '120' it will add it to the ascii value and look like this: 192
    This does it for all the letters individualy which makes it more secure.

#>

######################################

#Script Name:   ver.ps1
#Creator:       Luka Joksimovic
#Created:       07.03.2021  
#Updated:       08.03.2021, 09.03.2021

######################################

# PARAMETER 
Param (
    [Parameter(Mandatory=$true)][string]$Path
)

cd $Path

# Passing the key from 'key.ps1' to this file, in order to be in the same scope
. .\key.ps1

# Store the content from 'input.txt' into $file
$file = ".\input.txt"

# Gets the content from the file and saves it into $data
$data = Get-Content $file

# We create an array from all the characters in the string from $file
$data1 = $data.toCharArray()

# We create an empty array to save the objects after they have been converted into 'Base64', we will use it to convert the arrays back  into a string again
$ArrayToString = @()

# For each letter in the array '$data1' it will convert it to a ascii value and add the key value to it and then it will be stored into an array
foreach ($letter in $data1) {
    $letter = [int][char]$letter + $key
    $arrayToString += $letter
} 

# We Convert the objects from the array '$arrayToString' into Base64 and store it into a variable
#(I called the varaible the same way, because it will overwrite the other ones and it doesn't really matter)
$ArrayToString = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($Arraytostring))
# Save content to variable. / Because the varaible '$arrayToString' is still an array, we want it to become a string rather then to stay an array, this will be achived with the '-join' operator
$encrypt = $arrayToString -join ''
# The output from '$encrypt' will be piped into a file called 'encrypted.txt'
$encrypt | Out-File -FilePath .\encrypted.txt