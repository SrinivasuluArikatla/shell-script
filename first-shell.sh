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

# Main function to display system information
main() {
  get_cpu_info
  echo
  get_memory_info
  echo
  get_ip_address
  echo
  get_private_ip_address
}

# Run the main function
main

