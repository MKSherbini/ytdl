#!/bin/bash

# YouTube Audio Downloader Script

# Run yt-dlp with audio configuration
ytdl audio \
    --subfolder "_Downloads" \
    --batch-file='_batch.txt' \
    "$@"

# Pause equivalent - wait for user input
echo "Press any key to continue..."
read -n 1 -s