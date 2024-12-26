#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously.  Each process tries to create a lock file and then print a message.
# The race condition occurs because both processes try to create the lock file at the same time.
(while true; do touch lockfile.txt; echo 'Process 1 acquired the lock and created the file.'; rm lockfile.txt; sleep 1; done) &
(while true; do touch lockfile.txt; echo 'Process 2 acquired the lock and created the file.'; rm lockfile.txt; sleep 1; done) &

wait