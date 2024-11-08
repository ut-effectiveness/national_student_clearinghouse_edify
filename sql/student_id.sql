-- this will pull in the Banner student_id for those in the applicant, prospect, and inquiry files.

SELECT b.student_id,
       a.prospect_id
FROM quad.prospect a
INNER JOIN quad.student b ON b.prospect_id = a.crm_system_id;
