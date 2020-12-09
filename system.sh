#!/bin/bash

#command for free memory>>free_mem.txt
sudo free -h >> ~/backups/freemem/free_mem.txt
#command for disk usage>>disk_usage.txt
sudo df -h >> ~/backups/diskuse/disk_usgae.txt
#commmand for open files>>open_list.txt
sudo lsof -l >> ~/backups/openlist/open_list.txt
#command for system disk space statistics>>free_disk.txt
sudo du -hs >> ~/backups/freedisk/free_disk.txt
                                              
