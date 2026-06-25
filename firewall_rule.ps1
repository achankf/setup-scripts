# remove all trashes
Remove-NetFirewallRule

# block all connections and turn the firewall into a whitelist
Set-NetFirewallProfile -Profile Domain,Private,Public -DefaultInboundAction Block
Set-NetFirewallProfile -Profile Domain,Private,Public -DefaultOutboundAction Block

# add minimal set of rules
New-NetFirewallRule -DisplayName "Allow DHCP Outbound" `
                    -Program "%SystemRoot%\system32\svchost.exe" `
                    -Direction Outbound `
                    -Action Allow `
                    -Protocol UDP `
                    -RemotePort 67 `
                    -Profile Public

 New-NetFirewallRule -DisplayName "Allow DNS over HTTPS" `
                    -Program "%SystemRoot%\system32\svchost.exe" `
                    -Direction Outbound `
                    -Action Allow `
                    -Protocol TCP `
		    -RemotePort 53,443 `
                    -RemoteAddress 8.8.8.8,8.8.4.4 `
                    -Profile Public

 New-NetFirewallRule -DisplayName "Allow Firefox" `
                    -Program "%ProgramFiles%\Mozilla Firefox\firefox.exe" `
                    -Direction Outbound `
                    -Action Allow `
                    -Protocol TCP `
                    -Profile Public

New-NetFirewallRule -DisplayName "Temporary allow all outgoing TCP connections" `
		   -Direction Outbound `
		   -Action Allow `
		   -Protocol TCP `
		   -Enabled false `
		   -Profile Public

New-NetFirewallRule -DisplayName "Temporary allow all outgoing HTTP connections" `
		   -Direction Outbound `
		   -Action Allow `
		   -RemotePort 80,443 `
		   -Protocol TCP `
		   -Enabled false `
		   -Profile Public

New-NetFirewallRule -DisplayName "Temporary allow all outgoing UDP connections" `
		   -Direction Outbound `
		   -Action Allow `
		   -Protocol UDP `
		   -Enabled false `
		   -Profile Public

