

## How to run the backend?

1. Start docker-compose 
``` 
docker-compose up -d 
```

2. Configure Hasura

Follow the [Hasura Documentation](https://hasura.io/docs/latest/databases/ms-sql-server/getting-started/docker/#step-3-open-the-hasura-console) Steps 3-5. Use `MSSQL_DATABASE_URL` as environment variable when adding the database-connection and choose the `swps`-database when adding tables and relations.

3. (optional) Try Hasura

Follow the [Hasura Documentation](https://hasura.io/docs/latest/databases/ms-sql-server/getting-started/docker/#step-6-try-out-a-graphql-query) Step 6 for an example query.

```GraphQL
query { swps_Personen { Name Mail Anrede Aktiv PersonenExt { Latest_update PIN Personen_ID } } }
```

## What are the requirements?

To use this backend-code please download and install the following components:

- [Docker](https://docs.docker.com/desktop/) (is installed alingside with docker-compose)
- [docker-compose](https://docs.docker.com/compose/install/#installation-scenarios) 