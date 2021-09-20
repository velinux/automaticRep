. $(pwd)/vars/oracle.env
echo "SELECT SUM(BYTES)/1024/1024/1024 GB FROM DBA_EXTENTS where TABLESPACE_NAME not in ('%UNDO%');" | sqlplus -s $USER/$PW>@$DB > /tmp/undo_datafiles.log
