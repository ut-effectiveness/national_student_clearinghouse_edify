# National Student Clearing House Scripts
## Purpose: 
This repo contains sql and r code to generate and submit data to the National Student Clearinghouse (NSC) and generate the upload to Edify from the returned file.

You must have FTP permissions to the NSC site. (Registrar is the primary and can grant permissions.) https://www.studentclearinghouse.org/

You must be connected to the shared drive. (Command K)

## Prepare file for upload to NSC
Sign into Edify -> Export tab -> search for nsc_upload -> select table -> Execute DB Refresh to have the latest data from Slate and Banner.  

Open nsc_upload.rmd and run all the code chunks.  It will produce four files: enrolled, applicant, prospect, and inquiry. (We break them apart because of the upload file restrictions on NSC site.) I create a folder with the month and year on the shared drive in the National Student Clearing House folder to hold the files.  


## Upload to NSC
Sign into NSC https://www.studentclearinghouse.org/ using the FTP login.  Upload the four files, an email is sent to Andrea Bringhurst at UT with a subject of Delivery Receipt for (name of file) one for each file uploaded. A second email is sent to UT with a subject of StudentTracker File Accepted for Organization ID 003671-00 to let you know if your file was accepted or rejected with the errors/warnings. A third email is sent to UT with a subject of New Files Notification to let you know that you can download the files.  There are three files for each uploaded file.  The AGGRRPT file is a STUDENTTRACKER AGGREGATE REPORT: ANALYSIS OF INITIAL TRANSFERS, we are not currently using this file in Edify. The CNTLRPT file is an htm file with information similar to the AGGRRPT file, we are not currently using this file in Edify.  We use the DETLRPT file to produce the upload for Edify. Download this file to the shared drive in the National Student Clearing House folder.  I shorten the file name and save them to the folder on the shared drive.


## Prepare file for upload to Edify
Open edify_upload.rmd -> verify the file name and folder under ## Load Return Files and ## Generate NSC Upload to Edify File (You will need to update if you created a new folder for the downloaded files.).  Run all code chunks, this will produce one file to be loaded into Edify.


## Upload to Edify
Sign into Edify -> Intake tab -> flat_files -> outcome_measures_nsc_output -> Upload File 
After uploading you can check the status of the upload on the Intake Status tab second down on the left hand side; if there are errors look at the View Details on the far right side.  Once the status has completed without errors -> Build tab -> filter for nsc_outcomes -> select file name -> Execute Build Plan.  You can check the Build Plan Status from the second tab on the left side, if there are errors click on View Details.