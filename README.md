## Build the image 
Build with `docker build`:
```
docker build -t fim-db .
```

## Run the container

Then spin up a new container using `docker run`
```
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=jdgCw4otxMFWQDL5' -p 1433:1433 --name fim-db-1 -d fim-db
```

## Connect to Docker 

```
docker exec -it fim-db-1  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P jdgCw4otxMFWQDL5
```