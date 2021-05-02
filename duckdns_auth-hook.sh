#!/usr/bin/env bash
#
# Script to authenticate to DuckDNS to create a temporary TXT
# record for validating LetsEncrypt via DNS challenge.
# 
set -e

# Set global vars.
source /usr/local/certbot_files/certbot_config_vars.sh

echo url="https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&txt=$CERTBOT_VALIDATION&verbose=true" | curl -o $LOGDIR/update-curl.log -K -

# Sleep for 5 sec.
echo "Sleep for 5 sec ..."
sleep 5
