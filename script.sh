Project 1: System Health Monitoring Script
 What it does
Checks CPU, Memory, Disk usage
Alerts if usage crosses threshold
📝 Bash Script: system_health.sh
Copy code
Bash
#!/bin/bash

# Threshold values
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)

# Get Memory usage
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

# Get Disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | cut -d% -f1)

echo "CPU Usage: $CPU_USAGE%"
echo "Memory Usage: $MEM_USAGE%"
echo "Disk Usage: $DISK_USAGE%"

# Alerts
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
  echo "⚠️ High CPU usage detected"
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "⚠️ High Memory usage detected"
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "⚠️ High Disk usage detected"
fi