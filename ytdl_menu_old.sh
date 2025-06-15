#!/bin/bash

# ============================================================================
# YT-DLP WRAPPER SCRIPTS
# ============================================================================

# Set your utils directory
CONFIG_DIR="${YTDL_DIR}/configs"
YTDLP_SCRIPT="${YTDL_DIR}/ytdlsrc/yt_dlp/__main__.py"

# ============================================================================
# MAIN DOWNLOAD FUNCTION
# ============================================================================

ytdl_download() {
    local config_file="$1"
    shift
    
    if [[ ! -f "${CONFIG_DIR}/${config_file}" ]]; then
        echo "Error: Config file '${config_file}' not found in ${CONFIG_DIR}"
        return 1
    fi
    
    echo "Using config: ${config_file}"
    echo "Downloading: $*"
    
    python3 "${YTDLP_SCRIPT}" \
        --config-location "${CONFIG_DIR}/${config_file}" \
        "$@"
    
    echo "Press any key to continue..."
    read -n 1 -s
}

# ============================================================================
# INDIVIDUAL WRAPPER SCRIPTS
# ============================================================================

# Basic audio download
ytdl_audio() {
    ytdl_download "audio.conf" "$@"
}

# Basic video download  
ytdl_video() {
    ytdl_download "video.conf" "$@"
}

# Playlist download (inherits from base, you can override format)
ytdl_playlist() {
    ytdl_download "playlist.conf" "$@"
}

# Audio playlist
ytdl_playlist_audio() {
    ytdl_download "playlist.conf" --format "bestaudio" --extract-audio "$@"
}

# High-quality audio
ytdl_audio_hq() {
    ytdl_download "profiles/audio-hq.conf" "$@"
}

# Fast audio download
ytdl_audio_fast() {
    ytdl_download "profiles/audio-fast.conf" "$@"
}

# High-quality video
ytdl_video_hq() {
    ytdl_download "profiles/video-hq.conf" "$@"
}

# Archive quality (everything)
ytdl_archive() {
    ytdl_download "profiles/video-archive.conf" "$@"
}

# ============================================================================
# INTERACTIVE MENU SCRIPT
# ============================================================================

ytdl_menu() {
    echo "============================================"
    echo "YT-DLP Download Menu"
    echo "============================================"
    echo "1) Audio (Opus, High Quality)"
    echo "2) Audio (FLAC, Archival Quality)"  
    echo "3) Audio (Fast Download)"
    echo "4) Video (1080p, Good Quality)"
    echo "5) Video (High Quality)"
    echo "6) Video (Archive Everything)"
    echo "7) Playlist (Mixed Content)"
    echo "8) Playlist (Audio Only)"
    echo "9) Custom Config"
    echo "0) Exit"
    echo "============================================"
    
    read -p "Choose option [0-9]: " choice
    read -p "Enter URL(s): " urls
    
    case $choice in
        1) ytdl_audio $urls ;;
        2) ytdl_audio_hq $urls ;;
        3) ytdl_audio_fast $urls ;;
        4) ytdl_video $urls ;;
        5) ytdl_video_hq $urls ;;
        6) ytdl_archive $urls ;;
        7) ytdl_playlist $urls ;;
        8) ytdl_playlist_audio $urls ;;
        9) 
            read -p "Enter config filename (e.g., audio.conf): " config
            ytdl_download "$config" $urls
            ;;
        0) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option"; ytdl_menu ;;
    esac
}

# ============================================================================
# USAGE EXAMPLES
# ============================================================================

# If script is run directly, show menu
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    ytdl_menu
fi

# Example usage:
# source ytdl_menu.sh
# ytdl_audio "https://youtube.com/watch?v=VIDEO_ID"
# ytdl_video_hq "https://youtube.com/playlist?list=PLAYLIST_ID"
# ytdl_playlist_audio "https://youtube.com/playlist?list=PLAYLIST_ID"