FROM lcbruit/redcapbase:latest

ARG redcap_directory=redcap
ARG image_type=dev

# Specific REDCap Directory
RUN ln -s /var/www/redcap/redcap/ /var/www/html/$redcap_directory

# Run Redcap cronjob
RUN echo "* 8-18 * * * curl http://localhost/$redcap_directory/cron.php >> /cron.log 2>&1" | crontab - 

# Logos
ADD logos/${image_type} /logos

RUN mv /logos/redcap_logo_large.png /var/www/redcap/redcap/redcap_v*/Resources/images/redcap-logo-large.png
RUN mv /logos/redcap_logo_medium.png /var/www/redcap/redcap/redcap_v*/Resources/images/redcap-logo-medium.png
