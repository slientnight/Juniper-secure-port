# run 'show ethernet-switching table | grep ge- | no-more' on the switch to generate the input for switch.txt
#These commands work for juniper ELS switches which for us should only be the ex3400s and not the ex 4200s
#This command will clear all interfaces on most lab stacks of mac config. 'wildcard range delete interfaces ge-[0-4]/0/[0-47] unit 0 accept-source-mac'
$input_path = 'C:\$HOME\Desktop\switch.txt'
$output_path = 'C:\$HOME\Desktop\switch-output.txt'
$macregex = '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})'
$portregex = 'ge-.?\/.?\/\d+'
select-string -Path $input_path -Pattern $macregex  | % { $_.Matches } | % { $_.Value } > $output_path
$porttable = @()
$command_output = New-Object PSObject
foreach($line in Get-Content $input_path) {
    $line -match $macregex  > $null
        $macresult = $matches.0
    $line -match $portregex  > $null
        $portresult = $matches.0
    write-host "set interfaces" $portresult "unit 0 accept-source-mac mac-address" $macresult  
}