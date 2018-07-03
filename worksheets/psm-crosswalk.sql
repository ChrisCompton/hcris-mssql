/*
# Author:   Chris Compton
# Date:     June 2018
#################################
# Reason:   This sets up all of the crosswalk data to translate from Form 2552-96 to the 2552-10 format.
# For:      UAB MSHI Capstone Project
# Title:    A Sustainable Business Intelligence Approach 
#           to the U.S. Centers for Medicare and Medicaid Services Cost Report Data
#################################
# Install:  See README.md for instructions.
# Usage:
    EXEC spBuildCrosswalk 
        @ProductionMode = 1
*/
-- 0 = Test Mode 		- All actions simulated.  No permanent changes.
-- 1 = Production Mode 	- All actions permanent.  Will drop and create tables.

DROP PROCEDURE IF EXISTS spBuildCrosswalk;
GO

CREATE PROC
    spBuildCrosswalk
        @ProductionMode INTEGER = 0
    AS BEGIN

    print '*** RUNNING psm-crosswalk.sql'


        /************************************************************
            MODE
        ************************************************************/

        IF @ProductionMode = 1
            BEGIN
                print '*** RUNNING IN PRODUCTION MODE! TABLES DROPPED AND CREATED.'


                DROP TABLE IF EXISTS [MCR_CROSSWALK];

                CREATE TABLE [MCR_CROSSWALK] (
                    [FORM_NUM_96] [varchar](20) NULL,
                    [WKSHT_CD_96]    CHAR(7) NOT NULL,   
                    [LINE_NUM_96] [varchar](6) NULL,
                    [SUBLINE_NUM_96] [varchar](2) NULL,
                    [CLMN_NUM_96] [varchar](6) NULL,
                    [SUBCLMN_NUM_96] [varchar](2) NULL,	

                    [FORM_NUM] [varchar](20) NULL,
                    [WKSHT_CD]    CHAR(7) NOT NULL,
                    [LINE_NUM] [varchar](6) NULL,
                    [SUBLINE_NUM] [varchar](2) NULL,    
                    [CLMN_NUM] [varchar](6) NULL,
                    [SUBCLMN_NUM] [varchar](2) NULL	
                );


                -- ('2552-10','A000000',	'00100', ''	Not in the new report	
                -- ('A000000',	'00200', ''	Not in the new report
                INSERT INTO MCR_CROSSWALK (
                    [FORM_NUM_96],
                    [WKSHT_CD_96],
                    [LINE_NUM_96],    
                    [CLMN_NUM_96], 
                    
                    [FORM_NUM],  
                    [WKSHT_CD],
                    [LINE_NUM],
                    [CLMN_NUM]
                ) VALUES 




                --    (WKSHT_CD = 'G000000' AND LINE_NUM In ('001','002','011','022','051','036') 
                --                          AND CLMN_NUM In ('001','002','003','004'))

                ('2552-96', 'G000000', '00100', '00100', '2552-10', 'G000000', '00100', '00100'),
                ('2552-96', 'G000000', '00100', '00200', '2552-10', 'G000000', '00100', '00200'),
                ('2552-96', 'G000000', '00100', '00300', '2552-10', 'G000000', '00100', '00300'),
                ('2552-96', 'G000000', '00100', '00400', '2552-10', 'G000000', '00100', '00400'),
                ('2552-96', 'G000000', '00200', '00100', '2552-10', 'G000000', '00200', '00100'),
                ('2552-96', 'G000000', '00200', '00200', '2552-10', 'G000000', '00200', '00200'),
                ('2552-96', 'G000000', '00200', '00300', '2552-10', 'G000000', '00200', '00300'),
                ('2552-96', 'G000000', '00200', '00400', '2552-10', 'G000000', '00200', '00400'),
                ('2552-96', 'G000000', '01100', '00100', '2552-10', 'G000000', '01100', '00100'),
                ('2552-96', 'G000000', '01100', '00200', '2552-10', 'G000000', '01100', '00200'),
                ('2552-96', 'G000000', '01100', '00300', '2552-10', 'G000000', '01100', '00300'),
                ('2552-96', 'G000000', '01100', '00400', '2552-10', 'G000000', '01100', '00400'),
                ('2552-96', 'G000000', '02200', '00100', '2552-10', 'G000000', '03100', '00100'),
                ('2552-96', 'G000000', '02200', '00200', '2552-10', 'G000000', '03100', '00200'),
                ('2552-96', 'G000000', '02200', '00300', '2552-10', 'G000000', '03100', '00300'),
                ('2552-96', 'G000000', '02200', '00400', '2552-10', 'G000000', '03100', '00400'),
                ('2552-96', 'G000000', '03600', '00100', '2552-10', 'G000000', '04500', '00100'),
                ('2552-96', 'G000000', '03600', '00200', '2552-10', 'G000000', '04500', '00200'),
                ('2552-96', 'G000000', '03600', '00300', '2552-10', 'G000000', '04500', '00300'),
                ('2552-96', 'G000000', '03600', '00400', '2552-10', 'G000000', '04500', '00400'),        
                ('2552-96', 'G000000', '05100', '00100', '2552-10', 'G000000', '05900', '00100'),
                ('2552-96', 'G000000', '05100', '00200', '2552-10', 'G000000', '05900', '00200'),
                ('2552-96', 'G000000', '05100', '00300', '2552-10', 'G000000', '05900', '00300'),
                ('2552-96', 'G000000', '05100', '00400', '2552-10', 'G000000', '05900', '00400'),  

                -- OR (WKSHT_CD = 'G200000' AND LINE_NUM In ('025') 
                --                          AND CLMN_NUM In ('002','003'))   

                ('2552-96', 'G200000', '02500', '00200', '2552-10', 'G200000', '02800', '00200'),
                ('2552-96', 'G200000', '02500', '00300', '2552-10', 'G200000', '02800', '00300'), 

                -- OR (WKSHT_CD = 'G300000' AND LINE_NUM In ('003','006','007','023','025','031'))

                ('2552-96', 'G300000', '03000', '00100', '2552-10', 'G300000', '02800', '00100'),
                ('2552-96', 'G300000', '03100', '00100', '2552-10', 'G300000', '02900', '00100'),



                -- OR (WKSHT_CD = 'A000000' AND LINE_NUM In ('001','002','003','004','088','101') 
                --                          AND CLMN_NUM In ('003'))

                -- Refers to "Old" column in 96 form
                -- ('2552-96', 'A000000', '00100', '00300', '2552-10', 'A000000', 'XXXXX', 'XXXXX'),
                -- ('2552-96', 'A000000', '00200', '00300', '2552-10', 'A000000', 'XXXXX', 'XXXXX'),
                ('2552-96', 'A000000', '00300', '00300', '2552-10', 'A000000', '00100', '00300'),
                ('2552-96', 'A000000', '00400', '00300', '2552-10', 'A000000', '00200', '00300'),
                ('2552-96', 'A000000', '08800', '00300', '2552-10', 'A000000', '11300', '00300'),
                ('2552-96', 'A000000', '10100', '00300', '2552-10', 'A000000', '20000', '00300'),

                -- OR (WKSHT_CD = 'S300001' AND LINE_NUM In ('003','004','011','012') 
                --                          AND CLMN_NUM In ('006'))

                ('2552-96', 'S300001', '00300', '00600', '2552-10', 'S300001', '00500', '00800'),
                ('2552-96', 'S300001', '00400', '00600', '2552-10', 'S300001', '00600', '00800'),
                ('2552-96', 'S300001', '01100', '00600', '2552-10', 'S300001', '01300', '00800'),
                ('2552-96', 'S300001', '01200', '00600', '2552-10', 'S300001', '01400', '00800')






                UPDATE MCR_CROSSWALK SET
                    [LINE_NUM_96] = SUBSTRING(LINE_NUM_96,1,3),
                    [SUBLINE_NUM_96] = SUBSTRING(LINE_NUM_96,4,2)
                    WHERE LEN(LINE_NUM_96) = 5;


                UPDATE MCR_CROSSWALK SET
                    [LINE_NUM] = SUBSTRING(LINE_NUM,1,3),
                    [SUBLINE_NUM] = SUBSTRING(LINE_NUM,4,2)
                    WHERE LEN(LINE_NUM) = 5;


                UPDATE MCR_CROSSWALK SET
                    [CLMN_NUM_96] = SUBSTRING(CLMN_NUM_96,1,3),
                    [SUBCLMN_NUM_96] = SUBSTRING(CLMN_NUM_96,4,2)
                    WHERE LEN(CLMN_NUM_96) = 5;


                UPDATE MCR_CROSSWALK SET
                    [CLMN_NUM] = SUBSTRING(CLMN_NUM,1,3),
                    [SUBCLMN_NUM] = SUBSTRING(CLMN_NUM,4,2)
                    WHERE LEN(CLMN_NUM) = 5;


            -- END PRODUCTION MODE
            END
        ELSE
            BEGIN
                print '*** RUNNING IN TEST MODE! NO PERMANENT ACTION TAKEN.'
            END



 
    END

GO
   