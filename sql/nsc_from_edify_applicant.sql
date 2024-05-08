-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

--pull data from Edify

SELECT first_name,
  middle_initial,
  last_name,
  name_suffix,
  birth_date,
  nsc_id,
  term_id,
  MAX(term_start_date) AS term_start_date
FROM export.nsc_upload
-- remove applicants that have applied in the last 65 days
WHERE term_end_date < CURRENT_DATE - 65
-- remove applicants less than 16 years old
AND birth_date < CURRENT_DATE - 5840
AND nullif(last_name,'') is not null
AND student_status = 'Applicant'
AND student_status != 'Inquiry'
AND student_status != 'Prospect'
GROUP BY first_name,
  middle_initial,
  last_name,
  name_suffix,
  birth_date,
  nsc_id,
  term_id;

