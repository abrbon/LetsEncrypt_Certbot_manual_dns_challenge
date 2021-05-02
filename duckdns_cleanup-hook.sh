#!/usr/bin/env bash
#
# Script to cleanup the temporary TXT record previously made.
# 
set -e

# Set global vars.
source /usr/local/certbot_files/certbot_config_vars.sh

echo url="https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&txt=$CERTBOT_VALIDATION&verbose=true&clear=true" | curl -o $LOGDIR/clear-curl.log -K -

# Sleep for 5 sec.
echo "Sleep for 5 sec ..."
sleep 5

# Run deploy script now to copy the certs to the SSL location and restart the server/service.
source /usr/local/certbot_files/duckdns_deploy-hook.sh
