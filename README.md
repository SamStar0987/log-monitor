Log Monitoring & Alert Script

A lightweight Bash script for monitoring failed SSH login attempts on Linux servers.
It parses /var/log/auth.log, counts failed attempts, groups them by IP, and triggers threshold-based alerts.

Features

✅ Count all-time failed SSH login attempts

✅ Count failed attempts in the last 10 minutes

✅ Group attempts by IP address (most → least)

✅ Trigger an alert file when failed attempts exceed a threshold

✅ Simple output for easy debugging

Example Output:

$ ./log-monitor.sh
Checking for failed SSH login attempts in /var/log/auth.log...
-------------------------------------------------------
Total failed attempts (all time): 15
Failed attempts in last 10 minute(s): 0

Attempts by IP (most -> least):
     15 127.0.0.1

✅ No threshold alerts triggered.

Alert System:

* By default, the script creates an alert.log file if failed attempts in the last 10 minutes exceed 5.

* You can change the threshold at the top of the script:

THRESHOLD=5

Installation:

1. Clone this repo or copy log-monitor.sh to your server:

git clone https://github.com/SamStar0987/log-monitor
cd log-monitor
chmod +x log-monitor.sh

2. Run it manually:

./log-monitor.sh

* Roadmap:

 Automate with cron (run every 10 minutes)

 Add log rotation handling

 Send desktop/system notifications

 Optional email/Slack alerts

* Why This Matters:

Brute-force SSH attacks are common.

This script provides a beginner-friendly, transparent way to monitor suspicious activity without heavy tools like Fail2Ban.
