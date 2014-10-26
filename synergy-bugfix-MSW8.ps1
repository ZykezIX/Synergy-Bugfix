# Name: User Prompt Function
# Full-Name: synergy-bugfix-MSWQ.ps1
# Easy Name: synergy-bugfix
# File Type: Windows Powershell Script
# Version: 1.0.1
# By: John A. Reed - ZykezIX - secure@zykez.com
# Credits: Derik Palacino for the remKbCmd - Derik please contact me at the above
#	if you'd like more information shown here.

# Information: This powershell script removes several Windows Updates that directly
#	interfere with the normal operation of Synergy. It repairs such bugs as the
#	"Shift-Key" bug and other minor issues. Most of these packages are obsolete
#	any ways, and taken out of the running update queue, and is directly related
#	to using Windows 8.1 as the Synergy "Server". More may get added to this in
#	the future. 
#
# To Use: To run this file, right click on it and choose: "Run As PowerShell"
#
#	Please see: https://github.com/synergy/synergy/issues/4055 for more information.
#
# 	Applies To Synergy 1.5.1 - http://synergy-project.org/

$kbs = @(2975719,2977174,2982791,2984006,2993651,2994897,2995004,2995005,2993651)
$kbSearch = "KB" + ($kbs -join " OR KB")
foreach($kb in $kbs)
{
    $remKbCmd = "wusa.exe /uninstall /kb:$kb /quiet /log /norestart"
    Write-Host "Uninstalling KB$kb with '$remKbCmd'"

    Invoke-Expression -Command $remKbCmd;

    Write-Host "Waiting for KB$kb removal to finish ..."
    while (@(Get-Process wusa -ErrorAction SilentlyContinue).Count -ne 0)
    {
        Start-Sleep 1
    }
    Write-Host ""
}
# User Prompt Function
# Full directions/information at:
# https://github.com/ZykezIX/Synergy-Bugfix/blob/master/functions/zykezix-userprompt-1.0.0.ps1
#
# By John A. Reed - ZykezIX
#
# http://msdn.microsoft.com/en-us/library/x83z1d9f(v=vs.84).aspx

$a = new-object -comobject wscript.shell 
# ### Pop-Up Parameters ###
$intAnswer = $a.popup('This script has removed several updates installed by Windows Update known to cause issues with Synergy. These updates should have no adverse effects on your system and most of which have been decommissioned by Microsoft. However, if you need to restore these updates, you can do so by going to Control Panel, Windows Update, Restore Hidden Updates',15,"Notice",0)
# ### End Pop-Up Parameters ###
Start-Sleep -s 2
Write-Host ""
Write-Host 'Verifying Update Uninstallations:'
foreach($kb in $kbs)
{
	Write-Host "KB$kb has been uninstalled."
	Start-Sleep -m 1000
}
Start-Sleep -s 2
Write-Host 'Success! Please wait...'
Start-Sleep -s 1
restart-computer -confirm
Write-Host 'Exiting...'