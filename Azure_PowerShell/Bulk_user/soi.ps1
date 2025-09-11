# Import AD Module
Import-Module ActiveDirectory 

#Store the data from ADUsers.csv in the SADUsers variable
$ADUsers = Import-Csv -Path C:\soi\soi_users.csv

#Loop through each row containing user details in the CSV file
foreach ($user in $ADUsers) {
    #Read user data from each field in each row and assign the data to a variable as below


	$SamAccountName = $user.SamAccountName
	#$Password = $user.Password
	$FirstName = $user.FirstName
	$LastName  = $user.LastName
    $DisplayName = $user.DisplayName
	$OU = $user.OU
    $UserPrincipalName = $user.UserPrincipalName
	$Department = $User.Department

    #$securePassword = ConvertTo-SecureString "Passw0rd@123" -AsPlainText -Force

    $newUser = @{
        Name              = "$FirstName $LastName"
        GivenName         = $FirstName
        Surname           = $LastName
        SamAccountName    = $SamAccountName
        UserPrincipalName = $userPrincipalName
        DisplayName       = $DisplayName
        AccountPassword   = $securePassword
        Department         = $Department
        Path              = $OU
        Enabled           = $true
        securePassword = ConvertTo-SecureString "$user.Password" -AsPlainText -Force

        }
        New-ADUser @newUser
    }

<#	
	#Check to see if the user already exists in AD
	#if (Get-ADUser -F {SamAccountName -eq $Username})
	#{
		#If user does exist, give a warning 
	#	write-Warning "A user account with username $Username already exist in Active Directory."
	#}
	#else
	#{
		#User does not exist then proceed to create the new user account
		#Account will be created in the Ou provided by the 500 variable read from the CSV file


	Net-ADUser
			-samAccountName $Username `
			-UserPrincipalName "$Username@mylab.local" `
			-Name "$Firstname $Lastname" `
			-GivenName $Firstname `    
			-Surname $lastname `
			-Enabled $True `
			-DisplayName "$Firstname, $Lastname" `
			-Path $OU `
			-Department $Department `
			-AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $True
	
#>
    






