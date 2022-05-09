FROM mcr.microsoft.com/mssql/server:latest

ENV INSTANCE tcp:127.0.0.1
ENV DATABASE_NAME read_DB
ENV SA_PASSWORD yourStrong(!)Password
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

EXPOSE 1433

USER root

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
#     curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/msprod.list

RUN apt update && apt install -y unzip bash mssql-tools

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN chmod +x /usr/src/app/init.sh

USER mssql

CMD /bin/bash ./entrypoint.sh