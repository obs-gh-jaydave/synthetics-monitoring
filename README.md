# Synthetics Monitoring Project

This project sets up a monitoring system using Prometheus and Blackbox Exporter to perform synthetic checks and send the data to Observe.

## Overview

This setup uses Docker to run Prometheus and Blackbox Exporter in a single container. It performs health checks on specified endpoints and sends the collected metrics to Observe for analysis.

## Prerequisites

- Docker installed on your system
- An Observe account with a valid endpoint and authentication token

## Configuration Files

1. `Dockerfile`: Defines the container setup with Prometheus and Blackbox Exporter.
2. `prometheus.yml`: Configuration for Prometheus, including scrape configs and remote write settings.
3. `blackbox.yml`: Configuration for Blackbox Exporter, defining the modules for various checks.
4. `start.sh`: Script to start both Prometheus and Blackbox Exporter within the container.

## Setup Instructions

1. Clone this repository:

- ```git clone https://github.com/obs-gh-jaydave/synthetics-monitoring.git```

- ```cd synthetics-monitoring```

2. Update `prometheus.yml`:
- Modify the `remote_write` section with your Observe Prometheus endpoint and authentication token.
- Adjust the scrape configs as needed for your monitoring targets.

3. Update `blackbox.yml` if you need to modify the check modules.

4. Build the Docker image:

```docker build -t synthetics-monitoring .```

5. Run the container:

```docker run -d --name monitoring -p 9090:9090 -p 9115:9115 synthetics-monitoring```


## Accessing Prometheus

You can access the Prometheus web interface at `http://localhost:9090` when the container is running.

## Monitoring and Troubleshooting

- View container logs:

```docker logs monitoring```

- Access the container shell:

```docker exec -it monitoring /bin/sh```

## Customization

- To add or modify endpoints for monitoring, update the `prometheus.yml` file in the `scrape_configs` section.
- To change the check types or configurations, modify the `blackbox.yml` file.

## Notes

- Ensure your firewall allows outbound connections to the Observe Prometheus endpoint.
- Regularly check the Observe platform to verify that data is being received and processed correctly.