# Lösung zu Lab PipeLine2

```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers1.csv | New-ADUser
```
Die User werden allerdings mit der obigen Methode deaktiviert angelegt. da Accountpassword als Secure String verlangt wird.

```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers2.csv | ForEach-Object {
            New-ADUser -GivenName $PSItem.GivenName `
                       -Surname $PSItem.SurName `
                       -Name $PSItem.Name `
                       -SamAccountName $PSItem.SamAccountName `
                       -Department $PSItem.Department `
                       -Path $PSItem.Path `
                       -Enabled ([bool]::Parse($PSItem.Enabled)) `
                       -AccountPassword (ConvertTo-SecureString $PSItem.Password -AsPlainText -Force)
}
```

