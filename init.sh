echo 'SLEEP'
echo sleep 90s
echo 'START'
/opt/mssql-tools/bin/sqlcmd -S mssql -U SA -P "${SA_PASSWORD}" -Q "CREATE DATABASE ${DATABASE_NAME}"
echo 'END'
