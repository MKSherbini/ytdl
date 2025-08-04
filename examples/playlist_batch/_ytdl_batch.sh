#!/bin/bash

# batch download video playlist to _Downloads subfolder

# Run yt-dlp with audio configuration
ytdl video \
    --playlist \
    --subfolder "_Downloads" \
    --batch-file='_batch.txt' \
    "https://www.youtube.com/playlist?list=PLvGpI5t1gJ8QBXD00hjpdYbH8ozN0ntE2"
