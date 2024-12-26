# Shell Script Race Condition

This repository contains a simple bash script that demonstrates a race condition. The script launches two processes that concurrently attempt to create a lock file.  The race condition can lead to unpredictable outcomes, illustrating a common concurrency problem in shell scripting. 

A solution is provided that utilizes a more robust locking mechanism to avoid the race condition. 

**Bug:** The original script uses `touch lockfile.txt` to simulate locking.  This is unreliable because multiple processes can succeed in creating the file almost simultaneously, leading to unpredictable behavior.

**Solution:** The solution employs a more robust locking mechanism such as a mutex (mutual exclusion) which is more suitable for managing concurrent access to shared resources, preventing race conditions and ensuring data integrity.