# 🔐 Log Monitoring & Alert Script

A beginner-friendly but production-ready **Linux Bash monitoring tool** that detects failed SSH login attempts in real-time.  
This script helps identify brute-force attacks and suspicious login behavior by scanning `/var/log/auth.log`.

---

## 🚀 Features
- ✅ Counts total failed SSH login attempts (all time)  
- ✅ Detects failed attempts in the **last 10 minutes**  
- ✅ Groups and sorts attempts **by IP address**  
- ✅ Triggers an **alert** if attempts exceed a threshold (default = 3 in last 10 minutes)  
- ✅ Runs automatically with **cron**  

---

## 📂 Project Structure

log-monitor/
├── log-monitor.sh # Main Bash script
├── alerts/ # Stores alert files when triggered
└── README.md # Documentation

## 🖥️ Example Output

Checking for failed SSH login attempts in /var/log/auth.log...

Total failed attempts (all time): 15
Failed attempts in last 10 minute(s): 3

Attempts by IP (most -> least):
8 192.0.2.10
4 198.51.100.5
3 203.0.113.8

⚠️ ALERT: High number of failed SSH login attempts detected!

---

## ⚡ Usage

### 1. Clone this repo

```bash
git clone https://github.com/SamStar0987/log-monitor.git
cd log-monitor

2. Make the script executable

chmod +x log-monitor.sh

3. Run manually

./log-monitor.sh

4. Automate with cron (every 10 minutes)

crontab -e

Add this line at the bottom:

*/10 * * * * /home/itsme/log-monitor/log-monitor.sh >> /home/itsme/log-monitor/log-monitor.log 2>&1

🛡️  Why This Matters

Every Linux server is a target for brute-force SSH attacks.
This script provides a lightweight intrusion detection mechanism without needing heavy tools.

Helps sysadmins and cloud engineers monitor login security.

A practical portfolio project for Cloud / DevOps support roles.

Easy to extend with email, Slack, or AWS CloudWatch alerts.

🧑‍💻 Skills Proven

Linux log management (/var/log/auth.log)

Bash scripting (loops, conditionals, string matching)

Automation with cron

Git & GitHub documentation

