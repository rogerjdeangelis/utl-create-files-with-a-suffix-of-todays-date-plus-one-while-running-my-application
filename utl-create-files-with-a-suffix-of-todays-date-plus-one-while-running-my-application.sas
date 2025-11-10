%let pgm=utl-create-files-with-a-suffix-of-todays-date-plus-one-while-running-my-application;

%stop_submission;

RE: Create files with a suffix of todays date plus one while running my application

Too long to pst in listserv, see github

gihub
https://github.com/rogerjdeangelis/utl-create-files-with-a-suffix-of-todays-date-plus-one-while-running-my-application

community.altair.com
https://community.altair.com/discussion/5031?tab=all

PROBLEM

/**************************************************************/
/* CREATE FILES WITH TODAYS DATE PLUS 1                       */
/*                       |                                    */
/* GIVEN A FILE WITH     |   CREATE FILES                     */
/*                       |                                    */
/*   A 10                |   d:\txt\group_A-2025-11-11.txt    */
/*   A 20                |   A 10                             */
/*   A 30                |   A 20                             */
/*   B 40                |   A 30                             */
/*   B 50                |                                    */
/*   C 60                |   d:\txt\group_B-2025-11-11.txt    */
/*   C 70                |   B 40                             */
/*   C 80                |   B 50                             */
/*                       |                                    */
/*                       |   d:\txt\group_C-2025-11-11.txt    */
/*                       |   C 60                             */
/*                       |   C 70                             */
/*                       |   C 80                             */
/*                       |                                    */
/**************************************************************/

/*         _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| `_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

*/

data _null_;

  length fname $100;
  input group $ value;

  /* Create file name for each group */
  fname = cats("d:\txt\group_", group,'-', put(today()+1,e8601da.));

  /* Use FILEVAR= to write to different files dynamically */
  file dummy filevar=fname;

  /* Write data lines */
  put group value;
cards4;
A 10
A 20
A 30
B 40
B 50
C 60
C 70
C 80
;;;;
run;quit;


OUTPUT (TODAYS DATE PLUS 1)

d:\txt\group_A-2025-11-11.txt
A 10
A 20
A 30

d:\txt\group_B-2025-11-11.txt
B 40
B 50

d:\txt\group_C-2025-11-11.txt
C 60
C 70
C 80

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
