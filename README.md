# mssql-image

```DOCKER_BUILDKIT=0 docker build -t judahh/mssql-image -f .Dockerfile .```
```docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong\(\!\)Password" -e "DATABASE_NAME=read_DB" -p 1433:1433 -d judahh/mssql-image```
