#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Define the lock file
lockfile="lockfile.txt"

# Function to acquire the lock and execute code safely
lock_and_execute() {
  # Acquire the lock using flock
flock -x "$lockfile" || { echo "Failed to acquire lock."; exit 1; }

  echo "Process $$ acquired the lock."
  # Protected code section
  sleep 1

  # Release the lock
flock -u "$lockfile"
}

# Start two processes simultaneously. Each process calls the lock_and_execute function.
lock_and_execute &
lock_and_execute &

wait