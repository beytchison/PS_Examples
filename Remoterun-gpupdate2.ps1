get-module -listavailable | import-module
$List = get-adcomputer -searchbase "OU=Clients,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL" -filter {Enabled -eq $True} |select name | Sort-Object Name
foreach ($Thing in $List)
	{
	If (Test-Connection -Cn $Thing -quiet)
		{
		.\psexec \\$Thing -cdfs -accepteula \\SERVERSHARE\ASEP$\gpupdate.cmd
		}
	Else {"$Thing is not online"}
	}
