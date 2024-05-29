#!/bin/bash

# Function to get CPU information
get_cpu_info() {
  echo "CPU Info:"
  lscpu | grep 'Model name\|Socket(s)\|Core(s) per socket\|Thread(s) per core\|CPU(s)'
}

# Function to get memory information
get_memory_info() {
  echo "Memory Info:"
  free -h | grep 'Mem'
}

# Function to get public IP address
get_ip_address() {
  echo "Public IP Address:"
  curl -s http://169.254.169.254/latest/meta-data/public-ipv4 || echo "No public IP assigned"
}

# Function to get private IP address
get_private_ip_address() {
  echo "Private IP Address:"
  curl -s http://169.254.169.254/latest/meta-data/local-ipv4
}

# Function to get disk space information
get_disk_info() {
  echo "Disk Space Info:"
  df -h --total | grep 'total'
}

# Main function to display system information
main() {
  get_cpu_info
  echo
  get_memory_info
  echo
  get_ip_address
  echo
  get_private_ip_address
  echo
  get_disk_info
}

# Run the main function
main
