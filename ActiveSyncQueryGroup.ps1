$1 = get-adgroupmember GROUP1 | where {$_.SamAccountName -notlike "EXCLUDED_ACCOUNTS"} | Select Name,SamAccountName | Sort-Object Name
foreach ($2 in $1)
	{get-CASMailbox $2.SamAccountName}
$3 = get-adgroupmember -server DC2.DOMAIN2.EXAMPLE.LOCAL SPECIFIC_GROUP_2 | where {$_.SamAccountName -notlike "EXCLUDED_ACCOUNTS"} | Select Name,SamAccountName | Sort-Object Name
foreach ($4 in $3)
	{get-CASMailbox -domaincontroller DC3.DOMAIN3.EXAMPLE.LOCAL $4.SamAccountName}
$5 = get-adgroupmember -server DC3.DOMAIN3.EXAMPLE.LOCAL SPECIFIC_GROUP_3 | where {$_.SamAccountName -notlike "EXCLUDED_ACCOUNTS"} | Select Name,SamAccountName | Sort-Object Name
foreach ($6 in $5)
	{get-CASMailbox -domaincontroller DC3.DOMAIN3.EXAMPLE.LOCAL SPECIFIC_GROUP_3 $6.SamAccountName}