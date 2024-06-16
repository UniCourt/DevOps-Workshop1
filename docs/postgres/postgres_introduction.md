# What is Postgres?

PostgreSQL is an advanced, enterprise-class, and open-source relational database system. PostgreSQL supports both SQL (relational) and JSON (non-relational) querying.

PostgreSQL is a highly stable database backed by more than 20 years of development by the open-source community.

PostgreSQL is used as a primary database for many web applications as well as mobile and analytics applications.


## Why Postgres
- Data types: PostgreSQL supports all needed data types such as documents, primitives, geometry, structures etc.
- Data integrity: Postgres provides your data integrity by introducing constraints and regulating data you add. With PostgreSQL, you can forget about invalid or orphan records.
- Performance: Parallelization of read queries, powerful indexing methods, Multiversion concurrency control. These are only a few of numerous features implemented by PostgreSQL to boost and optimize its performance.
- Disaster Recovery & Reliability: PostgreSQL cares to provide the highest level of reliability for your data. With its sophisticated replication options, your data are totally safe. Besides, you can always backup the most valuable information.
- Extensibility: In this database, you don’t have to limit yourself to certain types of documents. The database offers you a wide selection of data types for your disposal.
- Internationalization & Text Search: Postgres supports international character sets. It also enables full-text search to speed up finding process and integrates case-insensitive and accent-insensitive collations.
- Support of non-relational data:It is probably the most important update of the database. Support of JSON, XML, Hstore and Cstore documents actually turns Postgres into NoSQL database.

## Commands
Once you are serving the database from your computer

- To list all db
`\l`
  
- To change db
`\c database_name;`

- To see the tables in the database
`\dt;`

- To describe a table
`\d table_name;`

- To select (and show in terminal) all tables
`SELECT * FROM table_name`


- To create a table
`CREATE TABLE table_name (col_name1, col_name2)`

- To add a row
`INSERT INTO table_name ( col_name )
VALUES ( col_value)`
col_name only require if only some of the cols are being filled out

- To edit a column to a table 
`ALTER TABLE table_name
  ALTER COLUMN column_name SET DEFAULT expression`

- To add a column to a table 
`ALTER TABLE table_name
  ADD COLUMN column_name data_type`

- To find the number of instances where the word “Day” is present in the title of a table
`SELECT count(title) FROM table_name WHERE title LIKE '%Day%’;`

- To delete a row in a table
`DELETE FROM table_name
  WHERE column_name = ‘hello';`


Postgresql follows the SQL convention of calling relations TABLES, attributes COLUMNs and tuples ROWS

**Transaction**
All or nothing, if something fails the other commands are rolled back like nothing happened

**Reference**
When a table is being created you can reference a column in another table to make sure any value which is added to that column exists in the referenced table.

```sql
CREATE TABLE cities (
  name text NOT NULL,
  postal_code varchar(9) CHECK (postal_code <> ''),
  country_code char(2) REFERENCES countries,
  PRIMARY KEY (country_code, postal_code)
);
```

`<>` means not equal


**Join reads**
You can join tables together when reading them,

**Inner Join**
Joins together two tables by specifying a column in each to join them by i.e.

```sql
SELECT cities.*, country_name
  FROM cities INNER JOIN countries
  ON cities.country_code = countries.country_code;
```

This will select all of the columns in both the countries
and cities tables the data, the rows are matched up by `country_code`.

**Grouping**
You can put rows into groups where the group is defined by a shared value in a particular column.

```sql
SELECT venue_id, count(*)
  FROM events
  GROUP BY venue_id;
```

This will group the rows together by the venue_id,
count is then performed on each of the groups.


**Create Index**
Indexes are special lookup tables that the database search engine can use to speed up data retrieval. Simply put, an index is a pointer to data in a table. An index in a database is very similar to an index in the back of a book.

```
CREATE INDEX salary_index ON COMPANY (salary);
```

**Create Views**
Views are pseudo-tables. That is, they are not real tables; nevertheless appear as ordinary tables to SELECT. A view can represent a subset of a real table, selecting certain columns or certain rows from an ordinary table. A view can even represent joined tables. Because views are assigned separate permissions, you can use them to restrict table access so that the users see only specific rows or columns of a table.

Basic view syntax
```
CREATE [TEMP | TEMPORARY] VIEW view_name AS
SELECT column1, column2.....
FROM table_name
WHERE [condition];
```