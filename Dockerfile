FROM mcr.microsoft.com/mssql/server

# Create a config directory
RUN mkdir -p /tmp/config
WORKDIR /tmp/config

# Bundle config source
COPY --chown=mssql . /tmp/config

# USER 1001
# Grant permissions for to our scripts to be executable
RUN chmod +x /tmp/config/entrypoint.sh
RUN chmod +x /tmp/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]
