FROM nextcloud:apache
RUN apt-get update && apt-get install -y procps smbclient && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install cron
RUN echo "*/5 * * * * php -f /var/www/html/cron.php" >> /etc/cron.d/nextcloud-cron
RUN chmod 0644 /etc/cron.d/nextcloud-cron
RUN crontab /etc/cron.d/nextcloud-cron
CMD cron && apache2-foreground
