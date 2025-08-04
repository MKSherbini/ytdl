#!/bin/bash

# Update video playlist in current directory

# Run yt-dlp with audio configuration
ytdl video \
    --playlist \
    "https://www.youtube.com/playlist?list=PLvGpI5t1gJ8QBXD00hjpdYbH8ozN0ntE2"
