-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

--pull in data from the national student clearinghouse
SELECT *
FROM quad.nsc_outcomes;
