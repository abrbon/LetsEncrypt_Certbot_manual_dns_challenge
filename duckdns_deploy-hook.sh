#!/usr/bin/env bash
#
# Deploy the (new) LE Certificates.
#
set -e 

# Set global vars.
source certbot_config_vars.sh

# Set some local vars if necessary.
# SOME_LOCAL_VAR=""

# Copy both fullchain and private LE certs to SSL dir.
cp $LE_CERTS_PATH/$LE_FULLCHAIN_CERT $SSL_PATH/$SSL_CERT
cp $LE_CERTS_PATH/$LE_PRIVATE_KEY $SSL_PATH/$SSL_KEY

# Finally restart the server/service you are using the certificates for (for example Nginx)
# so the (new) certificates are being used.
service nginx restart
