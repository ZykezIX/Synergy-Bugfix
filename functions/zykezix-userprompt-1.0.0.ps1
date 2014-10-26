# Name: User Prompt Function
# Full-Name: zykezix-userprompt-1.0.0.ps1
# Easy Name: zykezix-userprompt
# File Type: Windows Powershell Script
# Version: 1.0.0
# By: John A. Reed - ZykezIX - secure@zykez.com
#
# Information: This function allows for a powershell script to
#	display a dialogue box that prompts for user action, and
#	no action is taken, closes the prompt and continues the
#	script. Variables & Directions are below.
#
# Directions: In section "Pop-Up Parameters", adjust the variables
#	within the ()'s in this order:
#		("DisplayMessage",WaitSeconds,"Title",DisplayType)
#
# ##### Type of Display Prompt (DisplayType)#####
#		
#	0 - Simple confirmation statement with OK button.
#	1 - Confirm or Deny prompt with OK & Cancel buttons.
#	2 - Error style prompt with Abort, Retry, & Ignore buttons.
#	3 - "Are You Sure?" style prompt with Yes, No, & Cancel buttons.
#	4 - Simple Yes/No prompt with Yes and No buttons.
#	5 - "Somethings Not Right" style prompt with Retry & Cancel buttons.
#	6 - Simple Yes prompt.
#	7 - Simple No prompt.
#      -1 - Timeout.
#
# By John A. Reed - ZykezIX
# http://msdn.microsoft.com/en-us/library/x83z1d9f(v=vs.84).aspx

$a = new-object -comobject wscript.shell 
# ### Pop-Up Parameters ###
$intAnswer = $a.popup("Question?",2,"Title",4)
# ### End Pop-Up Parameters ###



