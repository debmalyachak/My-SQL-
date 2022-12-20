USE student_db;

CREATE TABLE admission_tab
(
addmission_date Char(20)
);

LOAD DATA LOCAL INFILE 'F:\\ivy_DataScience\\MySQL\\DateTimeCleaning\\Date Time Cleaning Exercise.csv'
INTO TABLE admission_tab
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

SELECT addmission_date
FROM admission_tab;

SELECT *
FROM admission_tab;

SET SQL_SAFE_UPDATES=0;

UPDATE admission_tab
SET    addmission_date=null
WHERE  addmission_date='NA';

UPDATE admission_tab
SET    addmission_date=REPLACE(addmission_date,',','');

UPDATE admission_tab
SET    addmission_date=REPLACE(addmission_date,';','');

UPDATE admission_tab
SET    addmission_date=REPLACE(addmission_date,'.',':');


SELECT STR_TO_DATE("22/06/2022 12:00:00","%d/%m/%Y %H:%i:%s");

ALTER TABLE admission_tab ADD(formatted_addmission_date DateTime);

UPDATE admission_tab
SET    formatted_addmission_date=(IFNULL(str_to_date(addmission_date,"%d-%b-%Y %H:%i:%s"),NULL));

              IFNULL(str_to_date(addmission_date,"%d-%m-%Y %h%i%p"),
                     IFNULL(str_to_date(addmission_date,"%d-%m-%Y %h:%i %p"),
                            IFNULL(str_to_date(addmission_date,"%d-%m-%Y-%h:%i %p"),
                                   IFNULL(str_to_date(addmission_date,"%d/%m/%Y %h:%i%p"),
                                          IFNULL(str_to_date(addmission_date,"%d/%m/%Y : %h:%i%p"),
                                                 IFNULL(str_to_date(addmission_date,"%d/%m/%Y %H:%i"),
                                                        IFNULL(str_to_date(addmission_date,"%d-%m-%Y %H:%i"),
                                                               IFNULL(str_to_date(addmission_date,"%d-%m-%Y : %H:%i"),
                                                                      IFNULL(str_to_date(addmission_date,"%d %M %Y - %H:%i"),
                                                                             IFNULL(str_to_date(addmission_date,"%D %M %Y - %h:%i"),
                                                                                    str_to_date(addmission_date,"%D %M %Y : %h:%i")
                                                                                    )
                                                                             )
																	 )
                                                               )
                                                       )
                                                 )
                                         )
                                  )
                            )
                    )
             )
             );

SELECT *
FROM
(
SELECT addmission_date,
       IFNULL(str_to_date(addmission_date,"%d-%b-%Y %H:%i:%s"),
              IFNULL(str_to_date(addmission_date,"%d-%m-%Y %h%i%p"),
                     IFNULL(str_to_date(addmission_date,"%d-%m-%Y %h:%i %p"),
                            IFNULL(str_to_date(addmission_date,"%d-%m-%Y-%h:%i %p"),
                                   IFNULL(str_to_date(addmission_date,"%d/%m/%Y %h:%i%p"),
                                          IFNULL(str_to_date(addmission_date,"%d/%m/%Y : %h:%i%p"),
                                                 IFNULL(str_to_date(addmission_date,"%d/%m/%Y %H:%i"),
                                                        IFNULL(str_to_date(addmission_date,"%d-%m-%Y %H:%i"),
                                                               IFNULL(str_to_date(addmission_date,"%d-%m-%Y : %H:%i"),
                                                                      IFNULL(str_to_date(addmission_date,"%d %M %Y - %H:%i"),
                                                                             IFNULL(str_to_date(addmission_date,"%D %M %Y - %h:%i"),
                                                                                    str_to_date(addmission_date,"%D %M %Y : %h:%i")
                                                                                    )
                                                                             )
																	 )
                                                               )
                                                       )
                                                 )
                                         )
                                  )
                            )
                    )
             )
		 converted_addmission_date
FROM admission_tab
WHERE addmission_date IS NOT NULL
) tt;

