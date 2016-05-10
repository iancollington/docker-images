#!/bin/bash
set -e
echo "Starting Oracle..."

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=XE

sh -c "/usr/sbin/startup.sh"

echo "Oracle startup complete"

if [ "$1" = 'runscript' ]; then
echo "Running SQL script $2..."
cd $(dirname "$2")
sqlplus -s system/oracle << EOF
whenever sqlerror exit sql.sqlcode;
set heading off
@$2
exit;
EOF
fi
echo "Oracle instance is ready for action"
exec /usr/sbin/sshd -D
