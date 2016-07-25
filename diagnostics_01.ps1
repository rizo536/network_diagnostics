###	Author: Eric Phonasa
### Goal: Create a general use network diagnostics script for troubleshooting connectivity
###
### Third Party Functions: Get-NetworkStatistics licensed by MIT
###
###

Import-Module ".\testconnection.psm1"
Import-Module ".\mainmenu.psm1"
Import-Module ".\netconnection.psm1"

# Call the display and menuswitch functions to begin script execution
display
menuswitch
