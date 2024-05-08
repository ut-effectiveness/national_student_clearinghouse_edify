-- !preview conn=DBI::dbConnect(RSQLite::SQLite())
--pull data from Edify

SELECT first_name,
  middle_initial,
  last_name,
  name_suffix,
  birth_date,
  nsc_id,
  term_id,
  MAX(term_end_date) AS term_end_date
FROM export.nsc_upload
WHERE student_status = 'Enrolled'
-- remove enrolled that have stopped out in the last 65 days
AND term_end_date < CURRENT_DATE - 65
-- remove enrolled less than 16 years old
AND birth_date < CURRENT_DATE - 5840
AND nullif(last_name,'') is not null
GROUP BY first_name,
  middle_initial,
  last_name,
  name_suffix,
  birth_date,
  nsc_id,
  term_id;

