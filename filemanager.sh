#!/bin/bash

# Function to display the menu
show_menu() {
    echo "Select an option:"
    echo "1) List files in a directory"
    echo "2) Move a file"
    echo "3) Delete a file"
    echo "4) Create a directory"
    echo "5) Exit"
}

# Function to list files in a directory
list_files() {
    read -p "Enter directory path: " dir_path
    if [ -d "$dir_path" ]; then
        echo "Files in $dir_path:"
        ls "$dir_path"
    else
        echo "Directory does not exist."
    fi
}

# Function to move a file
move_file() {
    read -p "Enter the file to move: " file_path
    if [ -f "$file_path" ]; then
        read -p "Enter the destination directory: " dest_dir
        if [ -d "$dest_dir" ]; then
            mv "$file_path" "$dest_dir"
            echo "File moved successfully."
        else
            echo "Destination directory does not exist."
        fi
    else
        echo "File does not exist."
    fi
}

# Function to delete a file
delete_file() {
    read -p "Enter the file to delete: " file_path
    if [ -f "$file_path" ]; then
        rm "$file_path"
        echo "File deleted successfully."
    else
        echo "File does not exist."
    fi
}

# Function to create a directory
create_directory() {
    read -p "Enter the directory path to create: " dir_path
    if [ ! -d "$dir_path" ]; then
        mkdir -p "$dir_path"
        echo "Directory created successfully."
    else
        echo "Directory already exists."
    fi
}

# Main program loop
while true; do
    show_menu
    read -p "Enter your choice: " choice
    case $choice in
        1)
            list_files
            ;;
        2)
            move_file
            ;;
        3)
            delete_file
            ;;
        4)
            create_directory
            ;;
        5)
            echo "Exiting."
            break
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
    echo ""
done
