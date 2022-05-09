echo 'SLEEP'
echo sleep 90s
echo "START ${DATABASE_NAME} ${SA_PASSWORD}"
/opt/mssql-tools/bin/sqlcmd -S mssql -U SA -P "${SA_PASSWORD}" -Q "
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = '${DATABASE_NAME}')
  BEGIN
    CREATE DATABASE ${DATABASE_NAME}
  END
"
echo 'END'
