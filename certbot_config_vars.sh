#!/usr/bin/env bash
#
# This script is used for setting some global variables to be used in other scripts
# You can include this script in other script using the 'source' option, 
# e.g.: source duckdns_config_vars.sh
#

# DuckDNS vars
TOKEN="<YOUR_DUCKDNS_TOKEN_HERE>"					# DuckDNS Token.
DOMAIN="<YOUR_DOMAIN_HERE>"							# Domain registered at DuckDNS.
SUB_DOMAIN_NAME="<YOUR_SUBDOMAIN_HERE>"				# Subdomain, this is the name you would like to create certs for.

# Certbot vars
LOGDIR="/usr/local/certbot_files/logs"				# Logging directory.
CERTBOT_WRKDIR="/usr/local/certbot_files"			# Working directory for all scripts to work from.
STAGING="--test-cert"								# Use '--test-cert' for testing first, leave blank for real certificates.
DRY_RUN="--dry-run"									# Use '--dry-run' to test first, no certs will be created in this mode.
													# Leave blank to disable dry-run.

AUTH_HOOK="duckdns_auth-hook.sh"					# Call this script to authenticate to DuckDNS to create a temporary TXT
													# record for validating LetsEncrypt via DNS challenge.

CLEANUP_HOOK="duckdns_cleanup-hook.sh"				# Call this script to cleanup the temporary TXT record previously made.

DEPLOY_HOOK="duckdns_deploy-hook.sh"				# Call this script to actually deploy the generated certificates and
													# copy them to the necessary location.


REGISTER_EMAIL="--register-unsafely-without-email"	# Email used for registration and recovery contact.
													# You will be able to receive notice about
													# impending expiration or revocation of your
													# certificates or problems with your Certbot
													# installation that will lead to failure to renew.
													# Not really necessary to register, if you don't want to,
													# use the '--register-unsafely-without-email' option here.
													# REGISTER_EMAIL="-m youremailhere@provider.com"

# SSH vars (like locations where the ssl certs should be copied)
SSL_PATH="/etc/ssl"
SSL_CERT="nginx-cert.pem"
SSL_KEY="nginx-key.pem"

# LetsEncrypt vars
LE_CERTS_PATH="/usr/local/etc/letsencrypt/live/$SUB_DOMAIN_NAME.$DOMAIN"
LE_FULLCHAIN_CERT="fullchain.pem"
LE_PRIVATE_KEY="privkey.pem"
