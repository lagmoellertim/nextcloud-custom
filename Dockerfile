FROM nextcloud:apache
RUN apt-get update && apt-get install -y procps smbclient cron && rm -rf /var/lib/apt/lists/*
RUN echo "*/5 * * * * /usr/local/bin/php -d memory_limit=-1 -f /var/www/html/cron.php" >> /etc/cron.d/nextcloud-cron
RUN chmod 0644 /etc/cron.d/nextcloud-cron
RUN crontab /etc/cron.d/nextcloud-cron
CMD cron && apache2-foreground
