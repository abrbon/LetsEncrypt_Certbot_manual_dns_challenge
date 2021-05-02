#!/usr/bin/env bash
#
# Start Certbot for first time to generate all files and folder.
#
set -e

# Set global vars.
source /usr/local/certbot_files/certbot_config_vars.sh

# Create log directory.
if [ ! -d $LOGDIR ]
then
	mkdir -p $LOGDIR >/dev/null 2>&1 && \
		echo "Directory $LOGDIR created."; \
		chmod o=,g=r $LOGDIR \
		|| echo "Error: Failed to create $LOGDIR directory."
else
	echo "Directory $LOGDIR already exists."
fi

certbot certonly $STAGING $DRY_RUN $REGISTER_EMAIL --manual --preferred-challenges=dns \
	--manual-auth-hook $CERTBOT_WRKDIR/$AUTH_HOOK \
	--manual-cleanup-hook $CERTBOT_WRKDIR/$CLEANUP_HOOK \
	-d $SUB_DOMAIN_NAME.$DOMAIN
