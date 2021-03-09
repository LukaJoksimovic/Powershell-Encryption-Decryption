<#$testArray = @('H', 'e', 'l', 'l', 'o')
$ArrayToString = @()

foreach ($item in $testArray) {
    $item = [int][char]$item
    $arrayToString += $item
    
}$arrayToString -join ''
#>
$item = 82

$zwi = $item - 10
$saved = [char]$zwi
$saved