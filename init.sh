echo 'SLEEP'
echo sleep 90s
echo "START ${INSTANCE} ${DATABASE_NAME} ${SA_PASSWORD}"
#-S [protocol:]server[instance_name][,port]
if sqlcmd -S ${INSTANCE} -U SA -P "${SA_PASSWORD}" -Q "
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = '${DATABASE_NAME}')
  BEGIN
    CREATE DATABASE ${DATABASE_NAME}
  END
"; then
    echo 'CREATE DATABASE SUCCESS'
else
    sqlcmd -U SA -P "${SA_PASSWORD}" -Q "
    IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = '${DATABASE_NAME}')
    BEGIN
        CREATE DATABASE ${DATABASE_NAME}
    END
    ";
fi
echo 'END'
