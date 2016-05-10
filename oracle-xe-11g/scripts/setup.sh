#!/bin/bash

# Start Oracle
sh /usr/sbin/startup.sh && 

# Install the entry point script for container
cp /scripts/oracle_entrypoint.sh /usr/sbin/oracle_entrypoint.sh &&
chmod +x /usr/sbin/oracle_entrypoint.sh &&

# Remove script files
rm -r /scripts/

exit $?
