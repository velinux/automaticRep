. $(pwd)/vars/oracle.env

echo "select name,(block_size * file_size_blks)/1024/1024 \"SIZE (MB)\" FROM v\$controlfile;" | sqlplus -s $USER/$PW>@$DB > /tmp/controlfiles.log
