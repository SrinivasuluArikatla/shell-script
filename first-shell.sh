#!/bin/bash

# Define threshold values
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80
CPU_THRESHOLD=80

# Define recipient email for alerts
ALERT_EMAIL="myessentialsone@gmail.com"

# Function to check disk usage
check_disk_usage() {
  DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
  if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    echo "Disk usage is above threshold: ${DISK_USAGE}% used."
    send_alert "Disk usage is high: ${DISK_USAGE}% used."
  else
    echo "Disk usage is within safe limits: ${DISK_USAGE}% used."
  fi
}

# Function to check memory usage
check_memory_usage() {
  MEMORY_USAGE=$(free | grep Mem | awk '{ print $3/$2 * 100.0 }' | awk -F. '{ print $1 }')
  if [ $MEMORY_USAGE -gt $MEMORY_THRESHOLD ]; then
    echo "Memory usage is above threshold: ${MEMORY_USAGE}% used."
    send_alert "Memory usage is high: ${MEMORY_USAGE}% used."
  else
    echo "Memory usage is within safe limits: ${MEMORY_USAGE}% used."
  fi
}

# Function to check CPU load
check_cpu_load() {
  CPU_LOAD=$(top -bn1 | grep "load average:" | awk '{ print $12 }' | sed 's/,//')
  CPU_LOAD_INT=$(echo $CPU_LOAD | awk -F. '{ print $1 }')
  if [ $CPU_LOAD_INT -gt $CPU_THRESHOLD ]; then
    echo "CPU load is above threshold: ${CPU_LOAD}"
    send_alert "CPU load is high: ${CPU_LOAD}"
  else
    echo "CPU load is within safe limits: ${CPU_LOAD}"
  fi
}

# Function to send an alert email
send_alert() {
  local message=$1
  echo "Sending alert: $message"
  echo "$message" | mail -s "System Alert" $ALERT_EMAIL
}

# Main script execution
echo "Starting system monitoring..."

check_disk_usage
check_memory_usage
check_cpu_load

echo "System monitoring complete."
