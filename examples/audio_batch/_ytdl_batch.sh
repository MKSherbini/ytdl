#!/bin/bash

# batch download audios to _Downloads subfolder 

# Run yt-dlp with audio configuration
ytdl audio \
    --subfolder "_Downloads" \
    --batch-file='_batch.txt' \
    "$@"