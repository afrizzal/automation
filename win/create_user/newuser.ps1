New-LocalUser -Name "Aff" -Password (ConvertTo-SecureString "MyPassword" -AsPlainText -Force)
Set-LocalUser -Name "Aff" -Description "New user account"
Add-LocalGroupMember -Group "Administrators" -Member "Aff"
Send-MailMessage -From "webmaster@company.com" -To "admin@company.com" -Subject "New user account created" -Body "A new user account has been created on the server"
