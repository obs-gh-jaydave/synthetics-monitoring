#!/bin/sh

# Start Blackbox Exporter
/bin/blackbox_exporter --config.file=/etc/blackbox/blackbox.yml &

# Start Prometheus
/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus --web.console.libraries=/usr/share/prometheus/console_libraries --web.console.templates=/usr/share/prometheus/consoles