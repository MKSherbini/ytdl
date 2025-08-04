#!/bin/bash

# batch download videos to _Downloads subfolder 

# Run yt-dlp with audio configuration
ytdl video \
    --subfolder "_Downloads" \
    --batch-file='_batch.txt' \
    "$@"
