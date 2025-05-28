$events = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625; StartTime=(Get-Date).AddMinutes(-10)}
$events | ForEach-Object {
    [PSCustomObject] {
        TimeCreated = $_.TimeCreated
        AccountName = $_.Properties[5].Value
        IPAddress = $_.Properties[18].Value
        Message = $_.Message

    }
} | Export-Csv -Path ".\logs\failed_logins.csv" -NoTypeInformation -Append