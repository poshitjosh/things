$cmd = `
@'
cmd /c start powershell -Command {
function Show-Menu
{
    param (
        [string]$Title = "Autopilot Group Tag"
    )
    Clear-Host
    [console]::WriteLine("  ================ Autopilot Group Tag ================")
    [console]::WriteLine("  1: Corporate Baseline - CORP" )
    [console]::WriteLine("  2: Development Baseline - DEV")
    [console]::WriteLine("  3: Conference Room - CORP-CONF")
    [console]::WriteLine("")
    [console]::WriteLine("  Q: Press Q to quit.")
    Write-Host ""
}

Show-Menu –Title "Choose Autopilot Group Tag"
$selection = Read-Host "Please make a selection"

switch ($selection)
{
     '1' { $grouptag = "CORP"} 
     '2' { $grouptag = "DEV"}
     '3' { $grouptag = "CORP-CONF"} 
     'q' { return }
}

If ($selection -eq 'q') { exit }
Else {
Connect-MSGraph
Get-WindowsAutoPilotInfo -Online -GroupTag $grouptag
}
}
'@

invoke-expression -Command $cmd
