
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Autopilot Registration'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(280,30)
$label.Text = 'Please choose a group tag to assign to this device. Azure Authentication Required.'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,50)
$listBox.Size = New-Object System.Drawing.Size(260,30)
$listBox.Height = 80

[void] $listBox.Items.Add('Corporate Baseline - CORP')
[void] $listBox.Items.Add('Development Baseline - DEV')
[void] $listBox.Items.Add('Conference Room - CORP-CONF')

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem
    if($x = 'Corporate Baseline - CORP') {$grouptag = 'CORP'}
    if($x = 'Development Baseline - DEV') {$grouptag = 'DEV'}
    if($x = 'Conference Room - CORP-CONF') {$grouptag = 'CORP-CONF'}
     
    Connect-MSGraph
    Get-WindowsAutoPilotInfo -Online -GroupTag $grouptag
}
