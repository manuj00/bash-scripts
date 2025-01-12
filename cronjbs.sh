#!/bin/bash

# Function to display the current cron jobs
show_cron_jobs() {
    echo "Current cron jobs:"
    crontab -l
}

# Function to add a cron job
add_cron_job() {
    echo "Enter the cron schedule (e.g., '0 0 * * 0' for every Sunday at midnight):"
    read cron_schedule
    echo "Enter the command to run (e.g., 'rm -rf /path/to/cache/*'):"
    read cron_command

    (crontab -l 2>/dev/null; echo "$cron_schedule $cron_command") | crontab -
    echo "Cron job added."
}

# Function to remove a cron job
remove_cron_job() {
    echo "Enter the command you want to remove from the cron jobs:"
    read cron_command

    crontab -l | grep -v "$cron_command" | crontab -
    echo "Cron job removed if it existed."
}

# Menu to choose action
while true; do
    echo "Choose an option:"
    echo "1) Show current cron jobs"
    echo "2) Add a cron job"
    echo "3) Remove a cron job"
    echo "4) Exit"
    read choice

    case $choice in
        1)
            show_cron_jobs
            ;;
        2)
            add_cron_job
            ;;
        3)
            remove_cron_job
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose 1, 2, 3, or 4."
            ;;
    esac
done

