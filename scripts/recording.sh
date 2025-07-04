#!/bin/bash
DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
sudo mount /dev/sda1 /mnt
mkdir -v ~/git/recordings/$DATE
sudo mv -v /mnt/RECORD/* ~/git/recordings/$DATE
