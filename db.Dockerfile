FROM mcr.microsoft.com/mssql/server:2022-CU11-ubuntu-22.04
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Secure-Password.1234

USER root
CMD /bin/bash ./entrypoint.sh
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY entrypoint.sh /usr/src/app
COPY run-initialization.sh /usr/src/app
COPY create-database.sql /usr/src/app
RUN chmod +x /usr/src/app/run-initialization.sh


# RUN chown -R mssql /var/opt/mssql
# USER mssql

# COPY --chown=mssql:root mydb.mdf /var/opt/mssql/data/mydb.mdf
# COPY --chown=mssql:root mydb_log.ldf /var/opt/mssql/data/mydb_log.ldf   