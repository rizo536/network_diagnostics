###	Author: Eric Phonasa
### Option 2 provides general use functions for diagnosing and troubleshooting remote device connectivity. 
###
###
###
###

function testconnection
{
	$tc = 1
	while($tc -eq 1)
	{
		seperator
		Write-Host 'Test Remote Device Connections Menu' -foreground "cyan"
		''
		'1) Test Connection/Ping Device'
		'2) Continuous Ping'
		'3) DNS Lookup'
		'4) Clear DNS Cache'
		'5) Trace Route to Device'
		'6) Main Menu'
		'7) End Script'
		''
		$testCnctOpt = Read-Host 'Input Menu Option'
		''
		switch ($testCnctOpt){
			# Basic Ping Utility that checks for connectivity first, then uses command line ping if device responds
			1	{	
				$name = Read-Host 'Input Device Name or IP Address'
				''
				Write-Host 'Pinging Remote Device...' -foreground "yellow"
				if (Test-Connection -ComputerName $name -Count 2 -Quiet)
					{						
						ping $name
						''
						Write-Host 'Device is pinging and responding' -foreground "green"					
					}
				
				else
					{
						''
						Write-Host 'No reponse or invalid address/name' -foreground "red"					
					}
				}
			# Asks for an IP Address, then opens up a new powershell window for Continuous Ping 
			2	{
					$name = Read-Host 'Input Device Name or IP Address'
					''
					Write-Host 'Opening up a new PowerShell window for Continuous Ping...' -foreground "yellow"
					Start-Sleep -s 1
					Start powershell "ping -t $name"
				}
			# Does a DNS Lookup
			3	{
					$name = Read-Host 'Input Device IP Address'
					''
					Resolve-DnsName $name
				}
			# Clears the DNS Cache on the client machine
			4	{
					Clear-DnsClientCache
					Write-Host 'DNS Cache Cleared' -foreground "yellow"
					Start-Sleep -s 1
				}
			# Tests for all gateways in between client and target
			5	{
					$name = Read-Host 'Input Target Name or IP Address'
					Test-NetConnection $name -traceroute
				}
			# Exit to Main Menu	
			6	{
					display
					$tc++
				}
			# Call endscript, which ends the... script.
			7	{
					endscript
				}
			Default {
					''
					Write-Host 'Invalid Option. Please try again.' -foreground "red"
				}
		}		
	}
}

# Writes an exit announcement and ends the script after waiting 2.5 seconds
function endscript
{
	Write-Host 'Ending Script...' -foreground "yellow"
	Start-Sleep -s 2.5
	exit
}