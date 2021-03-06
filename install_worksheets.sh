# Assumes you pass in a password or env variable with the password as the third argument.
# ./install_worksheets.sh "localhost,1433" TEST_MCR $DB_PASS

date

sqlcmd -S $1 -d $2 -U SA -P $3 -i worksheets/psm-crosswalk.sql -o install_worksheets.log
sqlcmd -S $1 -d $2 -U SA -P $3 -i worksheets/psm-worksheets-availability.sql -o install_worksheets.log
sqlcmd -S $1 -d $2 -U SA -P $3 -i worksheets/psm-worksheets-initialize.sql -o install_worksheets.log
sqlcmd -S $1 -d $2 -U SA -P $3 -i worksheets/psm-worksheets-load.sql -o install_worksheets.log
sqlcmd -S $1 -d $2 -U SA -P $3 -i worksheets/install_worksheets.sql -o install_worksheets.log

date