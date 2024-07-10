FROM prom/prometheus:latest as prometheus
FROM prom/blackbox-exporter:latest as blackbox

FROM alpine:latest

# Copy Prometheus from the official image
COPY --from=prometheus /bin/prometheus /bin/prometheus
COPY --from=prometheus /etc/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
COPY --from=prometheus /usr/share/prometheus/console_libraries/ /usr/share/prometheus/console_libraries/
COPY --from=prometheus /usr/share/prometheus/consoles/ /usr/share/prometheus/consoles/

# Copy Blackbox Exporter from the official image
COPY --from=blackbox /bin/blackbox_exporter /bin/blackbox_exporter

# Install necessary tools
RUN apk add --no-cache curl

# Copy configuration files
COPY blackbox.yml /etc/blackbox/blackbox.yml
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Prometheus and Blackbox Exporter ports
EXPOSE 9090 9115

# Start Prometheus and Blackbox Exporter
CMD ["/start.sh"]