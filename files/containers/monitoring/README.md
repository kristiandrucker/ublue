# Monitoring Stack

This directory contains the quadlet container definitions for a complete observability stack including:

- Grafana: Visualization and dashboarding
- Loki: Log aggregation with 90-day retention
- Mimir: Metrics storage with 90-day retention
- Tempo: Distributed tracing with 90-day retention
- OpenTelemetry Collector: Telemetry collection and routing
- Nginx Proxy Manager: Reverse proxy for external access

## Auto-Updates

All containers are configured to automatically update daily via:
- `io.containers.autoupdate=registry` label on each container
- `podman-auto-update.timer` systemd timer (runs daily at 00:15)
- Container engine auto-update configuration in `/etc/containers/containers.conf.d/auto-update.conf`

## OS Upgrades

The system is configured to automatically upgrade the OS and reboot weekly:
- `bootc-upgrade.timer` runs every Sunday at 01:00
- Uses `bootc upgrade` to rebase the ucore image from the remote registry
- System automatically reboots after the upgrade completes

## Authentication

Grafana is configured to use OpenID Connect (PKCE) with https://auth.drkr.io as the identity provider.

## Data Storage

All data is stored in subdirectories under `/mnt/data/` with the following structure:

- `/mnt/data/grafana/`: Grafana data and configuration
- `/mnt/data/loki/`: Loki data and configuration
- `/mnt/data/mimir/`: Mimir data and configuration
- `/mnt/data/tempo/`: Tempo data and configuration
- `/mnt/data/otel-collector/`: OpenTelemetry Collector data and configuration
- `/mnt/data/npm/`: Nginx Proxy Manager data and configuration

## Container Network

All containers are on the `monitoring` network, allowing them to communicate with each other using container names.

## External Access

- OTLP (OpenTelemetry Protocol):
  - gRPC: Port 4317
  - HTTP: Port 4318
- Grafana: Access through Nginx Proxy Manager
- Nginx Proxy Manager Admin UI: Port 81