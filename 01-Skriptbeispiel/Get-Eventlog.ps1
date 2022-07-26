<#
.SYNOPSIS
Kurzbeschreibung des Skriptes
.DESCRIPTION
Lange Beschreibung
.PARAMETER EventId
4624 | Anmeldevorgang
4625 | fehlgeschlagene Anmeldung
4634 | Abmeldevorgang
.EXAMPLE
Get-Eventlog.ps1 -EventId 4624  -Verbose
AUSFÜHRLICH: Write-Verbose ermöglicht uns zusätzliche optionale Ausgaben in unser Skript zu integrieren
AUSFÜHRLICH: 4624 , 5 , localhost

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  107652 Jul 26 16:06  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
  107649 Jul 26 16:05  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
  107646 Jul 26 16:04  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
  107643 Jul 26 16:04  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
  107640 Jul 26 16:04  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId ,

[ValidateRange(5,10)]
[int]$Newest = 5,

[ValidateScript({Test-NetConnection -ComputerName $PSItem -CommonTCPPort WINRM -InformationLevel Quiet})]
[string]$ComputerName = "localhost"
)

Write-Verbose -Message "Write-Verbose ermöglicht uns zusätzliche optionale Ausgaben in unser Skript zu integrieren"
Write-Verbose -Message "$EventId , $Newest , $ComputerName"
Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

