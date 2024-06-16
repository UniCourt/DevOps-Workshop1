## Running scripts using docker compose
We will be getting up Postgres and a simple script to run as containers using docker compose.


### Run Docker Compose
```
cd DevOps-Workshop1
docker compose up -d
```

### Working with database.
1. Login to database container as a postgres user.
```
docker exec -itu postgres workshop_postgres bash
```

2. Login to postgres
```
cd  # this will amke the directory to postgres users home directory
psql # To login to postgres
```

3. Create a database
```
CREATE DATABASE e_commerce;
```

4. Dump schema.sql file to e_commerce database
```
psql -U postgres -d student < sql_file/schema.sql
```
<hr>

[`Introduction to Postgres`](./postgres_introduction.md)