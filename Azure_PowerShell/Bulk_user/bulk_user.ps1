#Import active directory module for running AD cmdlets
#Author: AKKC

Import-Module activedirectory

#Store the data from ADUsers.csv in the $ADUsers variable
$Users = Import-csv C:\bulk\bulk_userlist.csv

#Loop through each row containing user details in the CSV file 
foreach ($User in $Users) {
    # Read user data from each field in each row
    # the username is used more often, so to prevent typing, save that in a variable

        # create a hashtable for splatting the parameters
        $user1 = @{
            SamAccountName                 = $User.SamAccountName                   
            Path                           = $User.path
            GivenName                      = $User.GivenName 
            Surname                        = $User.Surname
            DisplayName                    = $User.DisplayName
            #Password			           = $User.Password
            UserPrincipalName              = $user.UserPrincipalName 
            Department                     = $User.Department
            Name                           = $User.DisplayName
	        #Initials                      = $User.Initials
             Description                   = $User.Description
             Office                        = $User.Office
            #OfficePhone                   = $User.OfficePhone
            #StreetAddress                 = $User.StreetAddress
            #POBox                         = $User.POBox
             City                          = $User.City
             State                         = $User.State
            #PostalCode                    = $User.PostalCode
            #Title                         = $User.Title
             Company                       = $User.Company
             #Country                       = $User.Country
             EmailAddress                  = $User.Email
            AccountPassword                = (ConvertTo-SecureString $User.Password -AsPlainText -Force) 
            Enabled                        = $true
            #ChangePasswordAtLogon         = $true
        }   #end userprops   

         New-ADUser @user1

    } #end else
   