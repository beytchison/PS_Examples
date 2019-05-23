#$When = ((Get-Date).AddDays(-3)).Date
#Get-ADcomputer -searchbase "CN=Computers,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL" -properties modified,description -filter {(modified -le $when -and operatingsystem -like "*7*" -and Enabled -eq $True -and description -notlike "*") -or (modified -le $when -and operatingsystem -like "*xp*" -and Enabled -eq $True -and description -notlike "*")}| measure

$When = ((Get-Date).AddDays(-3)).Date
Get-ADcomputer -searchbase "CN=Computers,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL" -properties modified,description -filter {(modified -le $when -and operatingsystem -like "*7*" -and Enabled -eq $True -and description -notlike "*") -or (modified -le $when -and operatingsystem -like "*xp*" -and Enabled -eq $True -and description -notlike "*")}| move-adobject -targetpath "OU=BOH,OU=Clients,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL"

$When = ((Get-Date).AddDays(-3)).Date
Get-ADcomputer -searchbase "CN=Computers,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL" -properties modified,description -filter {(modified -le $when -and operatingsystem -like "*Mac OS X*" -and Enabled -eq $True -and description -notlike "*")}| move-adobject -targetpath "OU=AppleMacs,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL"

$When = ((Get-Date).AddDays(-3)).Date
Get-ADcomputer -searchbase "OU=Default,OU=Clients,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL" -properties modified,description -filter {modified -le $when -and enabled -eq $true}| move-adobject -targetpath "OU=BOH,OU=Clients,DC=CHILD_DOMAIN,DC=EXAMPLE,DC=LOCAL"

