Enable-NetFirewallRule -DisplayName "Remote Desktop"

Disable-NetFirewallRule -DisplayName "FTP Server (FTP Traffic-In)"

New-NetFirewallRule -DisplayName "HTTP (TCP-In)" -Protocol TCP -LocalPort 80 -Action Allow

New-NetFirewallRule -DisplayName "HTTPS (TCP-In)" -Protocol TCP -LocalPort 443 -Action Allow
