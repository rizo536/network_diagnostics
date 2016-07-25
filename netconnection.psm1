###	Author: Eric Phonasa
### Option 3 provides essential internal network diagnostic tools.
### Uses the Get-NetworkStatistics function under the MIT license.
###
###
###

Import-Module ".\Get-NetworkStatistics.psm1"

$localName = (Get-WmiObject Win32_ComputerSystem).Name
$domain = (Get-WmiObject Win32_ComputerSystem).Domain

function netconnection
{
	$nc = 1
	while($nc -eq 1)
	{
		seperator
		Write-Host "Local Hostname: " -nonewline; Write-Host "$localName" -foreground "magenta"
		Write-Host "User Domain: " -nonewline; Write-Host "$domain" -foreground "magenta"
		''
		Write-Host 'Network Utilities Menu' -foreground "cyan"
		''
		'1) View Computers On Network'
		'2) View Local Shares'
		'3) View Active Connections to Client'
		'4) Main Menu'
		'5) End Script'
		''
		$netCnctOpt = Read-Host 'Input Menu Option'
		''
		switch ($netCnctOpt){
			# Calls the Command Prompt Net View
			1	{
					Write-Host 'Obtaining List of Network Computers...' -foreground "yellow"
					Start-Sleep -s 1
					Net View | Out-Gridview
				}
			# Views Local Network Shares
			2	{
					Write-Host 'Obtaining Local Shares...' -foreground "yellow"
					Start-Sleep -s 1
					Get-SmbShare | Out-Gridview
				}
			# View Active Connections to Client
			3	{
					Write-Host 'Obtaining Active Connections...' -foreground "yellow"
					Start-Sleep -s 1
					Get-NetworkStatistics | Out-Gridview
				}
			# Exit to Main Menu
			4	{
					$nc++
					display
				}
			# Calls endscript, which MIGHT end the script... maybe... possibly...
			5	{
					Endscript
				}
			Default {
					''
					Write-Host 'Invalid Option. Please try again.' -foreground "red"
				}
			
		}
	}
}

# Writes an exit announcement and ends the script after waiting 5 seconds
function endscript
{
	Write-Host 'Ending Script...' -foreground "yellow"
	Start-Sleep -s 2.5
	exit
}