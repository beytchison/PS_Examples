param	(
	[string]$Username = $(throw "-username is required.")
	)
$1 = get-aduser $Username -properties employeeid | select samaccountname,employeeid,UserPrincipalName
$OldUPN = $1.UserPrincipalName
$OldSAM = $1.samaccountname
$Employeeid = $1.employeeid
$newSAM = $Employeeid
$newUPN = $Employeeid + "@CHILD_DOMAIN.EXAMPLE.LOCAL"
$oldPath = "\\FILE_SERVER.CHILD_DOMAIN.EXAMPLE.LOCAL\USER_SHARE$\" + $OldSAM
$newPath = "\\FILE_SERVER.CHILD_DOMAIN.EXAMPLE.LOCAL\USER_SHARE$\" + $NewSAM
write-host $oldSAM "is now" $newSAM
write-host $oldUPN "is now" $newUPN
#set-aduser $Username -samaccountname $newSAM -UserPrincipalName $newUPN -whatif
write-host $oldPath "is now" $newPath
#rename-item $OldPath $NewPath -whatif