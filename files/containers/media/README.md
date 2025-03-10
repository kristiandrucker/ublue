# Media Services Stack

This directory contains the quadlet container definitions for a comprehensive media consumption platform, including:

- Plex: Media streaming server for video, music, and photos
- Audiobookshelf: Self-hosted audiobook and podcast server

## Services Overview

### Plex Media Server

Plex provides a comprehensive media streaming solution:

- Stream your media library to any device
- Beautiful interface with rich metadata
- Transcoding capabilities for optimal playback
- Live TV integration (with compatible tuner hardware)
- Data stored in `/mnt/data/plex`

### Audiobookshelf

Audiobookshelf is a self-hosted audiobook and podcast server:

- Organize and stream your audiobook collection
- Track listening progress across devices
- Support for multiple users and libraries
- Podcast management capabilities
- Data stored in `/mnt/data/audiobookshelf`

## Storage Architecture

The media server uses two mount points:
- `/mnt/data`: For application configuration and metadata
- `/mnt/media`: For actual media content (videos, music, audiobooks)

This separation allows for efficient backup strategies and storage management.

## Hardware Acceleration

This image is based on Universal Blue's ucore-minimal with NVIDIA support, enabling:
- Hardware-accelerated video transcoding
- Better performance for media processing
- Reduced CPU load during streaming

## Networking

The media services use standard networking to allow communication with other services and client devices.

## Management

All services include:
- Auto-restart capability
- Container auto-update labels
- Web-based management interfaces
- Integration with system logging

## OS Information

This image provides:
- Atomic updates via rpm-ostree
- Container-focused lightweight OS
- Cockpit web console for system management
- Tailscale for secure remote access
- System monitoring tools (htop, btop)