function Show-Menu
{
    param (
        [string]$Title = 'Autopilot Group Tag'
    )
    Clear-Host
    Write-Host "================ Autopilot Group Tag ================`r`r`r"
    
    Write-Host "1: Corporate Baseline - CORP"
    Write-Host "2: Development Baseline - DEV"
    Write-Host "3: Conference Room - CORP-CONF"
    Write-Host "Q: Press 'Q' to quit."
}

Show-Menu –Title 'Choose Autopilot Group Tag'
$selection = Read-Host "Please make a selection"

switch ($selection)
{
     '1' {
         $grouptag = 'CORP'
     } '2' {
         $grouptag = 'DEV'
     } '3' {
         $grouptag = 'CORP-CONF'
     } 'q' {
         return
     }
 }

If ($selection -eq 'q') {}
Else {
Connect-MSGraph
Get-WindowsAutoPilotInfo -Online -GroupTag $grouptag
}
