# YTDL

A convenient wrapper script for yt-dlp with predefined configurations and automated batch processing support.

## Overview

YTDL is a bash-based wrapper for yt-dlp that provides preconfigured settings for different media types and use cases. It includes configuration files for various quality levels and formats, making it easy to download content with consistent settings.

## Features

- **Predefined Configurations**: Ready-to-use config files for different media types and quality levels
- **Batch Processing**: Support for batch downloads and automated updates
- **Multiple Format Support**: Audio, video, live streams, podcasts, and mobile-optimized formats
- **Quality Presets**: High quality, small file size, and archive configurations
- **Git Submodule Integration**: Includes yt-dlp source as a submodule for easy updates

## Project Structure

```
ytdl/
├── configs/
│   ├── audio.conf           # Standard audio downloads
│   ├── audio-hq.conf        # High-quality audio
│   ├── audio-small.conf     # Compressed audio
│   ├── base.conf            # Base configuration
│   ├── live.conf            # Live stream settings
│   ├── mobile.conf          # Mobile-optimized downloads
│   ├── podcast.conf         # Podcast-specific settings
│   ├── video.conf           # Standard video downloads
│   ├── video-hq.conf        # High-quality video
│   ├── video-small.conf     # Compressed video
│   └── video-archive.conf   # Archive-quality video
├── scripts/
│   └── ytdl                 # Main wrapper script
├── ytdlsrc/                 # yt-dlp source (git submodule)
├── .bashrc                  # Shell configuration
├── .gitmodules              # Git submodule configuration
├── ytdl_audio_batch.sh      # Audio batch processing script
└── ytdl_audio_updater.sh    # Audio update automation
```

## Requirements

Before installation, ensure you have the following dependencies:

### System Requirements
- **Linux/Unix/macOS**: Bash shell environment
- **Git**: For repository and submodule management
- **Python 3.6+**: Required for yt-dlp
- **ffmpeg**: Essential for audio/video processing and conversion

### Installing Requirements

#### Ubuntu/Debian:
```bash
sudo apt update
sudo apt install git python3 python3-pip ffmpeg curl wget
```

#### CentOS/RHEL/Fedora:
```bash
# CentOS/RHEL
sudo yum install git python3 python3-pip ffmpeg curl wget
# OR for newer versions
sudo dnf install git python3 python3-pip ffmpeg curl wget
```

#### macOS:
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install git python3 ffmpeg curl wget
```

#### Arch Linux:
```bash
sudo pacman -S git python python-pip ffmpeg curl wget
```

### Python Dependencies
The yt-dlp submodule may require additional Python packages:
```bash
pip3 install --user mutagen pycryptodome websockets brotli certifi
```

## Installation

1. **Clone the repository with submodules:**
   ```bash
   git clone --recursive https://github.com/MKSherbini/ytdl.git
   cd ytdl
   ```

2. **Install yt-dlp dependencies (if needed):**
   ```bash
   cd ytdlsrc
   pip3 install --user -r requirements.txt
   cd ..
   ```

3. **Make scripts executable:**
   ```bash
   chmod +x scripts/ytdl
   chmod +x ytdl_audio_batch.sh
   chmod +x ytdl_audio_updater.sh
   ```

4. **Test the installation:**
   ```bash
   ./scripts/ytdl --help
   ```

5. **(Optional) Add to your PATH:**
   ```bash
   # Add to your ~/.bashrc or ~/.bash_profile
   export PATH="$PATH:/path/to/ytdl/scripts"
   
   # Reload your shell configuration
   source ~/.bashrc
   ```

## Usage

### Basic Usage

The main script uses configuration files to simplify yt-dlp usage:

```bash
./scripts/ytdl [CONFIG_TYPE] [URL]
```

### Configuration Types

- **audio**: Standard audio extraction
- **audio-hq**: High-quality audio (best available quality)
- **audio-small**: Compressed audio for storage efficiency
- **video**: Standard video downloads
- **video-hq**: High-quality video downloads
- **video-small**: Compressed video for mobile/storage
- **video-archive**: Archive-quality video (maximum quality)
- **live**: Live stream capture settings
- **mobile**: Mobile-optimized downloads
- **podcast**: Podcast-specific settings

### Examples

Download audio in high quality:
```bash
./scripts/ytdl audio-hq "https://www.youtube.com/watch?v=VIDEO_ID"
```

Download video in standard quality:
```bash
./scripts/ytdl video "https://www.youtube.com/watch?v=VIDEO_ID"
```

Download entire playlist as audio:
```bash
./scripts/ytdl audio "https://www.youtube.com/playlist?list=PLAYLIST_ID"
```

### Batch Processing

For automated downloads, use the batch processing scripts:

```bash
# Process audio batch downloads
./ytdl_audio_batch.sh

# Run audio updater (for scheduled updates)
./ytdl_audio_updater.sh
```

## Configuration Files

Each configuration file in the `configs/` directory contains yt-dlp options optimized for specific use cases:

- **base.conf**: Common settings shared across configurations
- **audio*.conf**: Audio-specific options (format, quality, metadata)
- **video*.conf**: Video-specific options (resolution, codec, container)
- **live.conf**: Settings optimized for live stream capture
- **mobile.conf**: Mobile-friendly formats and resolutions
- **podcast.conf**: Podcast-optimized audio settings

## Automation with Cron

Set up automated downloads using cron jobs:

```bash
# Edit crontab
crontab -e

# Example: Run audio updater daily at 2 AM
0 2 * * * /path/to/ytdl/ytdl_audio_updater.sh

# Example: Process audio batch weekly on Sunday at 3 AM
0 3 * * 0 /path/to/ytdl/ytdl_audio_batch.sh
```

## Git Submodule Management

The project includes yt-dlp as a git submodule for easy updates:

```bash
# Update yt-dlp to latest version
git submodule update --remote ytdlsrc

# Initialize submodules if not cloned with --recursive
git submodule init
git submodule update
```

## Customization

### Modifying Configurations

Edit the configuration files in `configs/` to customize download behavior:

```bash
# Edit high-quality audio settings
nano configs/audio-hq.conf

# Edit video quality preferences
nano configs/video.conf
```

### Adding New Configurations

Create new configuration files for specific use cases:

```bash
# Create custom configuration
cp configs/base.conf configs/my-custom.conf
# Edit with your preferred settings
nano configs/my-custom.conf
```

## Dependencies

- **bash**: Shell environment
- **yt-dlp**: Video/audio downloader (included as submodule)
- **git**: For submodule management
- **ffmpeg**: For audio/video processing (yt-dlp dependency)

## Troubleshooting

### Common Issues

1. **Permission denied**: Ensure scripts are executable
   ```bash
   chmod +x scripts/ytdl ytdl_audio_batch.sh ytdl_audio_updater.sh
   ```

2. **yt-dlp not found**: Update the submodule
   ```bash
   git submodule update --remote ytdlsrc
   ```

3. **Configuration errors**: Check config file syntax and paths

### Debug Mode

Run with verbose output for debugging:
```bash
./scripts/ytdl video --verbose "URL_HERE"
```

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -am 'Add feature'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - The powerful video downloader this project wraps
- [youtube-dl](https://github.com/ytdl-org/youtube-dl) - The original inspiration

---

**Note**: This tool is for educational and personal use only. Please respect copyright laws and the terms of service of the websites you download from.