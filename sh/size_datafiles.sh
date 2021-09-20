. $(pwd)/vars/oracle.env
echo "set lines 200
SELECT SUM(BYTES)/1024/1024/1024 GB FROM DBA_DATA_FILES;" | sqlplus -s $USER/$PW>@$DB > /tmp/size_datafiles.log
