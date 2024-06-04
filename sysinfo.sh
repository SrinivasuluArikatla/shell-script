#!/bin/bash

# Function to display the system information menu
display_menu() {
    echo "System Information Script"
    echo "-------------------------"
    echo "1. Hostname"
    echo "2. OS Details"
    echo "3. Kernel Version"
    echo "4. CPU Information"
    echo "5. Memory Usage"
    echo "6. Disk Usage"
    echo "7. Network Configuration"
    echo "8. All Information"
    echo "9. Exit"
    echo -n "Enter your choice: "
}

# Function to get the hostname
get_hostname() {
    echo "Hostname: $(hostname)"
}

# Function to get the OS details
get_os_details() {
    echo "OS Details:"
    cat /etc/os-release
}

# Function to get the kernel version
get_kernel_version() {
    echo "Kernel Version: $(uname -r)"
}

# Function to get the CPU information
get_cpu_info() {
    echo "CPU Information:"
    lscpu
}

# Function to get the memory usage
get_memory_usage() {
    echo "Memory Usage:"
    free -h
}

# Function to get the disk usage
get_disk_usage() {
    echo "Disk Usage:"
    df -h
}

# Function to get the network configuration
get_network_config() {
    echo "Network Configuration:"
    ip a
}

# Function to get all information
get_all_info() {
    get_hostname
    echo
    get_os_details
    echo
    get_kernel_version
    echo
    get_cpu_info
    echo
    get_memory_usage
    echo
    get_disk_usage
    echo
    get_network_config
}

# Main script logic
while true; do
    display_menu
    read -r choice

    case $choice in
        1) get_hostname ;;
        2) get_os_details ;;
        3) get_kernel_version ;;
        4) get_cpu_info ;;
        5) get_memory_usage ;;
        6) get_disk_usage ;;
        7) get_network_config ;;
        8) get_all_info ;;
        9) echo "Exiting..."; break ;;
        *) echo "Invalid choice, please try again." ;;
    esac

    echo -n "Press Enter to continue..."
    read -r
    clear
done
