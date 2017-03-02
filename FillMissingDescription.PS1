<#
Created by Robbie Toumbs 
.SYNOPSIS
   <Used to fill missing Description information>
.DESCRIPTION
   <The script searches for users with missing Description information. 
   Once found it will copy the information from the Department in the Orginazation tab and added it to the Desciprtion field under the general tab>
.EXAMPLE
   <User had no information listed under the Description after running the script there department should now show>
#>
Get-ADUser -Filter {Description -notlike "*"} -Properties Description 
<#
Get-ADUser -LDAPFilter '(Department=*)' -Properties Description, Department |            
 Select-Object * -First 5 |            
 ForEach-Object {Set-ADObject -Identity $_.DistinguishedName ` 
  -Replace @{Description=$($_.Department)}}
  #>
  
