###	Author: Eric Phonasa
### Seperates the prompt from the menu display for error and system messaging purposes and provides basic menu functionality.
###
###
###
###

$localName = (Get-WmiObject Win32_ComputerSystem).Name
$domain = (Get-WmiObject Win32_ComputerSystem).Domain

# Displays menu and prompts by calling the menuswitch() function
function display
{
	seperator
	Write-Host "Local Hostname: " -nonewline; Write-Host "$localName" -foreground "magenta"
	Write-Host "User Domain: " -nonewline; Write-Host "$domain" -foreground "magenta"
	''
	Write-Host 'Main Menu' -foreground "cyan"
	''
	'1) Display Local Net Configuration' 
	'2) Test Remote Device Connections' 
	'3) Network Utilities'
	'4) End Script'
}

function menuswitch
{
	$ms =1
	while($ms -eq 1)
	{
		''
		$option = Read-Host 'Input Menu Option'
		''
		switch ($option){
			# Display Net Configuration (Add more details?)
			#				Or
			# Write a test prompt to the console
			1 	{	
					Write-Host 'Getting Configuration...' -foreground "yellow"
						<#
							cls
							''
							''
							''
							''
							''
							''
							''
							''
							''
							''
							'I FUCKING HATE TYLER'
						#>				
					Get-NetIPConfiguration 
					display
				}	
			
			# Calls the testconnection{} function
			2 	{ 
					testconnection
				}
				
			# Calls the netconnection() function
			3	{
					netconnection
				}
			
			# Writes an exit announcement and ends the script after waiting 5 seconds
			4 	{ 
					endscript
				}
			# Writes an error when user chooses an unavailable option
			Default	{
					''
					Write-Host 'Invalid Option. Please try again.' -foreground "red"
				}
			}
	}
}

# Ends the Script
function endscript
{
	Write-Host 'Ending Script...' -foreground "yellow"
	Start-Sleep -s 2.5
	exit
}

# UI Function meant to seperate menus for easier viewing.
# Implementation currently calls the seperator function at the beginning of the main display() function and on the "exit to main menu" switch statements.
function seperator
{
	''
	'-----------------------------------'
}

