$_listItems = Get-ChildItem -Path ./input
$_input = Import-Csv -Path ./list.csv




function Get-UniqueNewName{

    param(
        [Parameter(Position=0)]
        [string]$l_ext
    )
    $_used = Import-Csv -Path ./used.csv
    
    $num1 = Get-Random -Minimum 1 -Maximum $_input.Length
    $num2 = Get-Random -Minimum 1 -Maximum $_input.Length
    $num3 = Get-Random -Minimum 1 -Maximum $_input.Length
    
    $adj = $_input[$num1].Adjectives
    $verb = $_input[$num1].Verbs
    $noun = $_input[$num3].Nouns
    $new_name = "$($adj) $($verb) $($noun)$l_ext"
    
    while($new_name -In $_used."Used Names") {
	# write-output "duplicate" # ========== NOTE-TO-SELF: functions in Powershell are weird, even Write-Output will be in return value, only use this when testing function
	$num1 = Get-Random -Minimum 1 -Maximum $_input.Length
	$num2 = Get-Random -Minimum 1 -Maximum $_input.Length
	$num3 = Get-Random -Minimum 1 -Maximum $_input.Length
	
	$adj = $_input[$num1].Adjectives
	$verb = $_input[$num1].Verbs
	$noun = $_input[$num3].Nouns
	$new_name = "$($adj) $($verb) $($noun)$l_ext"
    }
    return $new_name
}



Set-Content -Path ./used.csv -Value '"Used Names"'
$_used = Import-Csv -Path ./used.csv


for($i=0; $i -lt $_listItems.Count; $i++){
    $length = $([String]$i).length
    $lefto = 5-$length
    $newname = "TEMP$("0"*$lefto)$i"
    $l_ext = $_listItems[$i].extension
    Rename-Item $_listItems[$i].fullname "$($newname)$l_ext"    
}


$listItems = Get-ChildItem -Path ./input


for($i=0; $i -lt $_listItems.Count; $i++){
    $new_name = Get-UniqueNewName($listItems[$i].extension)
    
    # ========== used.csv is for ensuring uniqueness
    $used_name_object = [PSCustomObject]@{
	"Used Names" = $new_name
    }    
    $used_name_object | Export-CSV "used.csv" -Append
    # ========== used.csv is for ensuring uniqueness    
    
    Write-Output "new name: $($new_name)"  
    
    Rename-Item $listItems[$i].fullname $new_name	
}
