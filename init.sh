echo 'SLEEP'
echo sleep 90s
echo "START ${INSTANCE} ${DATABASE_NAME} ${SA_PASSWORD}"
#-S [protocol:]server[instance_name][,port]
/opt/mssql-tools/bin/sqlcmd -S ${INSTANCE} -U SA -P "${SA_PASSWORD}" -Q "
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = '${DATABASE_NAME}')
  BEGIN
    CREATE DATABASE ${DATABASE_NAME}
  END
"
echo 'END'
