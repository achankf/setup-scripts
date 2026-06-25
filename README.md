# setup-scripts

## To eliminate (most) garbage firewall rules added by Windows:

Purpose: to turn the firewall into a whitelist with minimal number of rules.

1. Open `firewall_rule.ps1` and change the following rules to your liking:
   - `Allow DNS over HTTPS`: under `RemoteAddress`, change Google DNS to your liking
   - `Allow Firefox`: change it to your favourite browser, and optionally add "80,443" to `RemotePort` if you only use it for browsing
1. Copy `firewall_rule.ps1` to a protected folder, e.g. `C:\Program Files\my_own_scripts`
1. Search for `Task Scheduler` and then add a recurring task on login for the script
   - trigger: At log on of any user
   - run whether user is logged on or not, and don't store password
   - run with highest privileges
   - action: `powershell.exe`, with `Add arguments (optional)` being `-NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\Program Files\my_own_scripts\firewall_rule.ps1"`
