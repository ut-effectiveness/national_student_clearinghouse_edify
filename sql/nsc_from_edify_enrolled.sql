--pull data from Edify

SELECT first_name,
  middle_initial,
  last_name,
  name_suffix,
  birth_date,
  nsc_id,
  term_id,
  -- updates term end date to current date for current term drop/stop out students
  CASE WHEN MAX(term_end_date) > CURRENT_DATE THEN CURRENT_DATE - 1
      ELSE MAX(term_end_date)
  END AS term_end_date
FROM export.nsc_upload
WHERE student_status = 'Enrolled'
-- remove enrolled that have stopped out in the last 5 days
AND term_end_date < CURRENT_DATE - 5
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
