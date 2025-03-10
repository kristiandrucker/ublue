# Core Services Stack

This directory contains the quadlet container definitions for essential infrastructure services including:

- Authentication: Identity and access management
- DNS: Network name resolution with ad-blocking
- Proxy: Reverse proxy for secure external access

## Services Overview

### Authentication

The authentication service provides identity management and single sign-on capabilities for other services in the infrastructure:

- Based on Pocket-ID
- OpenID Connect provider with PKCE flow
- Used by other services for authentication
- Data stored in `/mnt/data/auth/data`

### DNS

The DNS service provides secure and filtered DNS resolution:

- Ad-blocking capabilities
- Customizable filtering rules
- Support for DNS-over-HTTPS and DNS-over-TLS
- Management interface on port 3000
- Configuration stored in `/mnt/data/adguard-home`

### Proxy

The reverse proxy service provides secure access to internal services:

- SSL/TLS termination
- Easy certificate management
- Management interface on port 81
- Exposes services on standard HTTP/HTTPS ports (80/443)
- Configuration stored in `/mnt/data/proxy`

## Networking

The core services use a shared network called `proxy.network` to enable service discovery and communication.

## Data Storage

All service data is stored in subdirectories under `/mnt/data/` for persistence across container and system restarts.

## Management

All services include:
- Auto-restart capability
- Container auto-update labels
- Web-based management interfaces
- Integration with system logging

## OS Information

This image is based on Universal Blue's ucore-minimal image, providing:
- Atomic updates via rpm-ostree
- Container-focused lightweight OS
- Cockpit web console for system management
- Tailscale for secure remote access
- System monitoring tools (htop, btop)