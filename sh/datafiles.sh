. $(pwd)/vars/oracle.env

echo "select FILE_NAME, BYTES/1024/1024 MB, AUTOEXTENSIBLE, MAXBYTES/1024/1024 MAX_MB from dba_data_files;" | sqlplus -s $USER/$PW>@$DB > /tmp/datafiles.log
