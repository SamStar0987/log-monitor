#!/bin/bash
# =========================================================
# Log Monitoring & Alert Script
# Author: Samiul Islam
# Description:
#   This script monitors the auth.log file for failed SSH 
#   login attempts. It counts total attempts, recent attempts,
#   groups them by IP, and triggers alerts if a threshold is met.
#
# Usage:
#   ./log-monitor.sh
#
# Requirements:
#   - Linux system with /var/log/auth.log available
#   - Bash shell
# =========================================================

# Path to the log file
LOG_FILE="/var/log/auth.log"

# Time window for recent attempts (minutes)
TIME_WINDOW=10

# Threshold for triggering an alert
THRESHOLD=3

# Directory for saving alerts
ALERT_DIR="./alerts"
mkdir -p "$ALERT_DIR"

echo "Checking for failed SSH login attempts in $LOG_FILE..."
echo "-------------------------------------------------------"

# --- Count all failed attempts ---
total_count=$(grep -c "Failed password" "$LOG_FILE")

# --- Count recent failed attempts ---
recent_count=$(grep "Failed password" "$LOG_FILE" | \
               awk -v d="$(date --date="$TIME_WINDOW min ago" '+%b %e %H:%M:%S')" \
               '$0 > d' | wc -l)

# --- Attempts by IP (all time) ---
attempts_by_ip=$(grep "Failed password" "$LOG_FILE" | \
                 awk '{print $(NF-3)}' | \
                 sort | uniq -c | sort -nr)

# --- Print stats ---
echo "Total failed attempts (all time): $total_count"
echo "Failed attempts in last $TIME_WINDOW minute(s): $recent_count"
echo
echo "Attempts by IP (most -> least):"
echo "$attempts_by_ip"

# --- Threshold alert check ---
if [ "$recent_count" -ge "$THRESHOLD" ]; then
    echo
    echo "⚠️ ALERT: High number of failed SSH login attempts detected!"
    alert_file="$ALERT_DIR/alert_$(date +%Y%m%d_%H%M%S).log"
    echo "[$(date)] ALERT: $recent_count failed attempts in last $TIME_WINDOW minutes" > "$alert_file"
    echo "Alert saved to $alert_file"
else
    echo
    echo "✅ No threshold alerts triggered."
fi
